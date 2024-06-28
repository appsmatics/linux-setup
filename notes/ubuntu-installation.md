### ubuntu windows installation setup
the steps to install ubuntu is described in the web page(https://ubuntu.com/tutorials/create-a-usb-stick-on-windows#1-overview)

1. download the ubuntu version in the link - https://releases.ubuntu.com/22.04/ubuntu-22.04.4-desktop-amd64.iso
2. get a usb drive with minimum 6 gb storage, then we are going to create a bootable USB stick.
3. download and instal rufus a free and open source USB stick writing tool - https://rufus.ie/

### steps to write usb stick by rufus
perform the following to configure your USB device in Rufus:

1. Launch Rufus
2. Insert your USB stick
3. Rufus will update to set the device within the Device field
4. If the Device selected is incorrect (perhaps you have multiple USB storage devices), select the correct one from the device field’s drop-down menu
5. To select the Ubuntu ISO file you downloaded previously, click the SELECT to the right of “Boot selection”. If this is the only ISO file present in the Downloads folder you will only see one file listed.

6. Select the appropriate ISO file and click on Open.
7. The Volume label will be updated to reflect the ISO selected.

8. Leave all other parameters with their default values and click START to initiate the write process.
9. The Volume label will be updated to reflect the ISO selected.

10. Leave all other parameters with their default values and click START to initiate the write process.

11. You will then be alerted that Rufus has detected that the Ubuntu ISO is an ISOHybrid image. This means the same image file can be used as the source for both a DVD and a USB stick without requiring conversion.

12. Keep Write in ISO Image mode selected and click on OK to continue.

13. Rufus will also warn you that all data on your selected USB device is about to be destroyed. This is a good moment to double check you’ve selected the correct device before clicking OK when you’re confident you have.

14. The ISO will now be written to your USB stick, and the progress bar in Rufus will give you some indication of where you are in the process. With a reasonably modern machine, this should take around 10 minutes. Total elapsed time is shown in the lower right corner of the Rufus window

15. When Rufus has finished writing the USB device, the Status bar will be filled green and the word READY will appear in the center. Select CLOSE to complete the write process.

16. You now have Ubuntu on a USB stick, bootable and ready to go.

17. To use it you need to insert the stick into your target PC or laptop and reboot the device. It should recognise the installation media automatically during startup but you may need to hold down a specific key (usually F12) to bring up the boot menu and choose to boot from USB.(In our case it did not automatically recognised the usb flash dreive, so we restarted thr intel device and pressed the F2 key.Then changed the boot order and saved the changes.Now the usb boot drive automatically recognised and installation also done)