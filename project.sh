echo "enter the address"
read address
echo "enter the file format"
read format
find $address -name "*$format" > backup.conf
echo "enter the directory address"
read address2
timestamp = $(date +"%Y-%m-%d_%H-%M-%S")
output_file = "${address2}/${timestamp}_backup.tar.gz"
tar -cvf "$output_file" -T backup.conf
