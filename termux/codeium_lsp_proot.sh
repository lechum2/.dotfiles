#!/data/data/com.termux/files/usr/bin/bash

unset LD_PRELOAD
proot -r ~/../usr/var/lib/proot-distro/installed-rootfs/archlinux/ -0 -w / -b /dev -b /proc -b /sys -b /data/data/com.termux/files/usr/tmp /bin/codeium_lsp $@
