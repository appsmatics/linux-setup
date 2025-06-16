#!/bin/bash

# Loop through years and print current + next year
for year in {2023..2026}; do
    next_year=$((year + 1))
    echo "## Current year: $year, Next year: $next_year"
    find  -type f -newermt "$year-01-01" ! -newermt "$next_year-01-01"  
done