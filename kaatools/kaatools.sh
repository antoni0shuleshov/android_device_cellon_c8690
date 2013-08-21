function fbflash(){
  fastboot -i 0x283b flash $1 $ANDROID_PRODUCT_OUT/$2
}
function fbsys(){
  fbflash system system.img
}
function fbrd(){
  fbflash ramdisk ramdisk-uboot.img
}
function fbud(){
  fbflash userdata userdata.img
}

function apush(){
  adb wait-for-device
  adb remount
  adb push $ANDROID_PRODUCT_OUT/$1 $1
}
#
# $1 - search template
# $2 - dir to search
function grp_common(){
  find $2 -name .repo -prune -o -path $(gettop)/out -prune -o -name .git -prune -o  -type f \( -name "*.java" -o -name "*.c" -o -name "*.h" -o -name "*.cpp" -o -name "*.mk" \) -print0 | xargs -0 grep --color -n "$1"
}
# search $1 within current dir
function grp(){
  grp_common $1 .
}
# search $2 within dir $1
function grpd(){
  grp_common $2 $1
}
# search $1 within mk
function grpmk(){
  find . -name .repo -prune -o -path $(gettop)/out -prune -o -name .git -prune -o -type f -name "*\.mk" -print0 | xargs -0 grep --color -n "$@"
}