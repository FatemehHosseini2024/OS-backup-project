echo "enter the address"
read address
echo "enter the file format"
read format
find $address -name "*$format" > backup.conf
