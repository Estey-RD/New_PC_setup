This is for Ubuntu Desktop version

When doing system setup script, comment out the part that you don't need

``` source setup_system.sh ```

It will do:  
1. Create an application list before run
2. Install some app
3. Install timeshift and create a snapshot (just like Windows recovery point)
4. Create an application list after the run, also create another file containing all the app installed

Disk Partition Table setup:

1. EFI   600 MB      ( for UEFI boot )
2. Swap  40961       ( > physical memory)
3. /     30721       ( for kernel )
4. /home 512001      ( main partition )

Chrome
VScode
Sublime Text
