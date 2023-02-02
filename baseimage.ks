lang en_US.UTF-8
keyboard us
timezone --utc UTC

part / --size 500 --ondisk sda --fstype=ext4

repo --name=adaptation0-jolla-@RELEASE@-@ARCH@ --baseurl=https://releases.jolla.com/releases/@RELEASE@/jolla-hw/adaptation-jolla-x86-emul/@ARCH@/
repo --name=hotfixes-@RELEASE@-@ARCH@ --baseurl=https://releases.jolla.com/releases/@RELEASE@/hotfixes/@ARCH@/
repo --name=jolla-@RELEASE@-@ARCH@ --baseurl=https://releases.jolla.com/releases/@RELEASE@/jolla/@ARCH@/
repo --name=sdk-@RELEASE@-@ARCH@ --baseurl=https://releases.jolla.com/releases/@RELEASE@/sdk/@ARCH@/
repo --name=coderus-baseimage-@ARCH@ --baseurl=http://repo.merproject.org/obs/home:/coderus:/baseimage/@ARCH@/

%packages
android-tools
atruncate
attr
basesystem
deltarpm
file
kbd
kernel-adaptation-pc
mic
net-tools
passwd
pigz
qemu-usermode-common
qemu-usermode-static
rootfiles
syslinux-extlinux
systemd-config-mer
usbutils
xdg-user-dirs
zypper
%end

%pre
touch $INSTALL_ROOT/.bootstrap
%end

%post
echo -n "@ARCH@-meego-linux" > /etc/rpm/platform
echo "arch = @ARCH@" >> /etc/zypp/zypp.conf
rm -f /var/lib/rpm/__db*
rpm --rebuilddb
rm -f /.bootstrap
%end

%post --nochroot
if [ -n "$IMG_NAME" ]; then
    echo "BUILD: $IMG_NAME" >> $INSTALL_ROOT/etc/meego-release
fi
%end
