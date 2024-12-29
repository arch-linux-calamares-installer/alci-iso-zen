#!/usr/bin/env bash
# shellcheck disable=SC2034

# This script defines the configuration for building an Arch Linux ISO.
#
# Variables:
# iso_name: The name of the ISO.
# iso_label: The label of the ISO, which includes the current date.
# iso_publisher: The publisher information for the ISO.
# iso_application: The application description for the ISO.
# iso_version: The version of the ISO, which includes the current date.
# install_dir: The directory where the ISO will be installed.
# buildmodes: The modes in which the ISO can be built.
# bootmodes: The boot modes supported by the ISO.
# arch: The architecture of the ISO.
# pacman_conf: The path to the pacman configuration file.
# airootfs_image_type: The type of image used for the root filesystem.
# airootfs_image_tool_options: The options for the tool used to create the root filesystem image.
# bootstrap_tarball_compression: The compression options for the bootstrap tarball.
# file_permissions: An associative array defining the file permissions for specific files and directories.
iso_name="aurumOS"
iso_label="AURUM_$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y%m)"
iso_publisher="Ecliptica Ltd. <https://ecliptica.pp.ua>"
iso_state="ALPHA"
iso_codename="AURORA"
iso_application="aurumOS Live/Rescue DVD"
iso_version="$iso_state-$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y.%m.%d)-$iso_codename"
install_dir="aurum"
buildmodes=('iso')
bootmodes=('bios.syslinux.mbr' 'bios.syslinux.eltorito'
  'uefi-ia32.systemd-boot.esp' 'uefi-x64.systemd-boot.esp'
  'uefi-ia32.systemd-boot.eltorito' 'uefi-x64.systemd-boot.eltorito')
arch="x86_64"
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'xz' '-Xbcj' 'x86' '-b' '1M' '-Xdict-size' '1M')
bootstrap_tarball_compression=('zstd' '-c' '-T0' '--auto-threads=logical' '--long' '-19')
file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/root"]="0:0:750"
  ["/root/.automated_script.sh"]="0:0:755"
  ["/root/.gnupg"]="0:0:700"
  ["/usr/local/bin/choose-mirror"]="0:0:755"
  ["/usr/local/bin/Installation_guide"]="0:0:755"
  ["/usr/local/bin/livecd-sound"]="0:0:755"
  ["/etc/polkit-1/rules.d"]="0:0:750"
  ["/etc/sudoers.d"]="0:0:750"
  ["/usr/local/bin/alci-make-a-pure-arch"]="0:0:755"
  ["/usr/local/bin/alci-displaymanager-check"]="0:0:755"
  ["/usr/local/bin/alci-virtual-machine-check"]="0:0:755"
  ["/usr/local/bin/get-nemesis-on-alci"]="0:0:755"
  ["/usr/local/bin/fix-keys"]="0:0:755"
)
