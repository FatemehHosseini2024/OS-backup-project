echo "enter the address"
read address
echo "enter the file format"
read format
find $address -name "*$format" > backup.conf
echo "enter the directory address"
read address2
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
output_file="${address2}/${timestamp}_backup.tar.gz"
start_time=$(date +%s)
tar -czf "$output_file" -T backup.conf
status=$?
end_time=$(date +%s)
duration=$((end_time - start_time))
filesize=$(du -m "$output_file" | cut -f1)
log_file="backup.log"
now=$(date +"%Y-%m-%d %H:%M:%S")
