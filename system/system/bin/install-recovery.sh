#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/13540000.dwmmc0/by-name/RECOVERY:29704208:3c15b5101d965aa8e478f4186dfbef722843df98; then
  applypatch --bonus /system/etc/recovery-resource.dat \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/13540000.dwmmc0/by-name/BOOT:20588560:cd0e958cb3a0ca4e49f00362c5f6407aafbc8327 \
          --target EMMC:/dev/block/platform/13540000.dwmmc0/by-name/RECOVERY:29704208:3c15b5101d965aa8e478f4186dfbef722843df98 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
