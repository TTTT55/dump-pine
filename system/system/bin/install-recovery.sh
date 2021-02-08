#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:9b766d546ae7af218671fef6c159074e3c67d51b > /cache/recovery/last_install_recovery_status; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:33554432:d9658ff8e72e34f77cf7691c5f9772e77587ed00 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:9b766d546ae7af218671fef6c159074e3c67d51b >> /cache/recovery/last_install_recovery_status && \
      echo "Installing new recovery image: succeeded" >> /cache/recovery/last_install_recovery_status || \
      echo "Installing new recovery image: failed" >> /cache/recovery/last_install_recovery_status
else
  echo "Recovery image already installed" >> /cache/recovery/last_install_recovery_status
fi
