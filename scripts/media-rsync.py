#!/usr/bin/env python3
"""
Finds all image and video files in a source directory, automatically discovers
the years present based on file modification times, and rsyncs the files
to a destination directory organized by year.
"""

import os
import sys
import subprocess
import argparse
from datetime import datetime
import shutil
import tempfile
from collections import defaultdict

# --- Configuration: Add more extensions as needed ---
IMAGE_EXTENSIONS = {
    '.jpg', '.jpeg', '.png', '.gif', '.heic', '.heif',
    '.tiff', '.tif', '.bmp', '.webp', '.raw', '.arw',
    '.cr2', '.cr3', '.nef', '.orf', '.sr2', '.dng'
}
VIDEO_EXTENSIONS = {
    '.mp4', '.mov', '.avi', '.mkv', '.mts', '.m2ts',
    '.mpg', '.mpeg', '.webm', '.flv', '.3gp'
}
MEDIA_EXTENSIONS = IMAGE_EXTENSIONS.union(VIDEO_EXTENSIONS)

def check_rsync():
    """Check if rsync is installed and available in the system's PATH."""
    if not shutil.which('rsync'):
        print("Error: 'rsync' command not found.", file=sys.stderr)
        print("Please install rsync and ensure it is in your system's PATH.", file=sys.stderr)
        sys.exit(1)

def main():
    """Main function to parse arguments and orchestrate the sync process."""
    parser = argparse.ArgumentParser(
        description="Automatically discover and sync media files from a source to a destination, organized by year.",
        formatter_class=argparse.RawTextHelpFormatter,
        epilog="""
Example Usage:
  # Scan a source folder, discover all years, and sync them to a backup drive
  python3 sync_media_by_year.py /path/to/my/photos /mnt/backup/media

  # Do the same, but automatically confirm the prompt to proceed
  python3 sync_media_by_year.py /path/to/my/photos /mnt/backup/media --yes

  # Perform a dry run to see which years would be found and what would be synced
  python3 sync_media_by_year.py /path/to/my/photos /mnt/backup/media --dry-run
"""
    )
    parser.add_argument('--source', help="The source directory to scan for media files.")
    parser.add_argument('--destination', help="The destination root directory.")
    parser.add_argument(
        '--dry-run',
        action=argparse.BooleanOptionalAction,    
        default=True,
        help="Perform a trial run without making any changes. Shows the rsync commands that would be executed."
    )
    parser.add_argument(
        '-y', '--yes',
        action='store_true',
        help="Skip the confirmation prompt and proceed with syncing all discovered years."
    )

    args = parser.parse_args()

    # --- Pre-run Checks ---
    check_rsync()

    if not os.path.isdir(args.source):
        print(f"Error: Source directory not found at '{args.source}'", file=sys.stderr)
        sys.exit(1)

    source_abs_path = os.path.abspath(args.source)
    print(f"Source: {source_abs_path}")
    print(f"Destination: {args.destination}")
    if args.dry_run:
        print("--- DRY RUN MODE: No files will be copied. ---\n")

    # --- Pass 1: Scan and build file lists for each year ---
    print("Scanning source directory to discover years and build file lists...")
    files_by_year = defaultdict(list)

    for root, _, files in os.walk(source_abs_path):
        for filename in files:
            if os.path.splitext(filename)[1].lower() in MEDIA_EXTENSIONS:
                source_path = os.path.join(root, filename)
                try:
                    mtime = os.path.getmtime(source_path)
                    file_year = datetime.fromtimestamp(mtime).year
                    # rsync --files-from needs paths relative to the source directory
                    relative_path = os.path.relpath(source_path, source_abs_path)
                    files_by_year[file_year].append(relative_path)
                except FileNotFoundError:
                    print(f"Warning: Could not access '{source_path}', skipping.", file=sys.stderr)

    discovered_years = sorted(list(files_by_year.keys()))

    if not discovered_years:
        print("\nScan complete. No media files found in the source directory.")
        sys.exit(0)

    print(f"\nScan complete. Discovered media files for years: {discovered_years}")

    # --- Confirmation Step ---
    if not args.yes and not args.dry_run:
        try:
            proceed = input("Proceed with syncing these years? (y/n): ").lower()
            if proceed != 'y':
                print("Aborting at user request.")
                sys.exit(0)
        except (KeyboardInterrupt, EOFError):
            print("\nAborting at user request.")
            sys.exit(0)


    # --- Pass 2: Iterate over the discovered years and run rsync ---
    total_files_to_sync = 0
    for year in discovered_years:
        file_list = files_by_year[year]
        file_count = len(file_list)
        total_files_to_sync += file_count
        print(f"\nProcessing Year {year}: Found {file_count} files.")

        dest_year_path = os.path.join(args.destination, str(year))

        if args.dry_run:
            print(f"  [DRY RUN] Would create directory '{dest_year_path}' if needed.")
            print(f"  [DRY RUN] Would execute rsync for {file_count} files to '{dest_year_path}'")
            continue

        # For actual run, create a temporary file with the list of files
        tmp_file = None
        try:
            with tempfile.NamedTemporaryFile(mode='w', delete=False, encoding='utf-8', prefix=f"rsync_{year}_") as fp:
                tmp_file = fp.name
                fp.write('\n'.join(file_list))

            os.makedirs(dest_year_path, exist_ok=True)
            
            rsync_command = [
                'rsync', '-av', '--info=progress2',
                f"--files-from={tmp_file}",
                '--no-relative',
                source_abs_path,
                dest_year_path
            ]
            print(f"  Syncing {file_count} files to '{dest_year_path}'...")
            subprocess.run(rsync_command, check=True)

        except (subprocess.CalledProcessError, OSError) as e:
            print(f"\nError during rsync for year {year}: {e}", file=sys.stderr)
            print("Aborting to prevent further errors.", file=sys.stderr)
            sys.exit(1)
        finally:
            if tmp_file and os.path.exists(tmp_file):
                os.remove(tmp_file)

    print("\n--- Summary ---")
    if args.dry_run:
        print(f"Files that would be synced across all discovered years: {total_files_to_sync}")
        print("Dry run complete. No changes were made.")
    else:
        print(f"Files considered for sync across all discovered years: {total_files_to_sync}")
        print("Sync complete.")

if __name__ == "__main__":
    main()