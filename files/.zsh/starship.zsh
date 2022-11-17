# find out which distribution we are running on
LFILE="/etc/lsb-release"
MFILE="/System/Library/CoreServices/SystemVersion.plist"
TFILE="/tmp/lsb-release"


if [[ -f $LFILE ]]; then
  _distro=$(awk '/^ID=/' /etc/*-release | awk -F'=' '{ print tolower($2) }')
elif [[ ! -f $TFILE ]]; then
  lsb_release -a | grep ID | awk -F":" '{print tolower($2) }' | xargs | tee $TFILE
elif [[ -f $TFILE ]]; then
  _distro=$(cat $TFILE)
elif [[ -f $MFILE ]]; then
  _distro="macos"
fi


# set an icon based on the distro
# make sure your font is compatible with https://github.com/lukas-w/font-logos

export DISTO="$_distro"

case $_distro in
    *kali*)                  ICON="ﴣ";;
    *arch*)                  ICON="";;
    *debian*)                ICON="";;
    *raspbian*)              ICON="";;
    *ubuntu*)                ICON="";;
    *elementary*)            ICON="";;
    *fedora*)                ICON="";;
    *coreos*)                ICON="";;
    *gentoo*)                ICON="";;
    *mageia*)                ICON="";;
    *centos*)                ICON="";;
    *opensuse*|*tumbleweed*) ICON="";;
    *sabayon*)               ICON="";;
    *slackware*)             ICON="";;
    *linuxmint*)             ICON="";;
    *alpine*)                ICON="";;
    *aosc*)                  ICON="";;
    *nixos*)                 ICON="";;
    *devuan*)                ICON="";;
    *manjaro*)               ICON="";;
    *rhel*)                  ICON="";;
    *macos*)                 ICON="";;
    *)                       ICON="";;
esac

export STARSHIP_DISTRO="$ICON"
