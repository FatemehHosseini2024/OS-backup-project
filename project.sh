echo "enter the address"
read address
echo "enter the file format"
read format
find $address -name "*$format" > backup.conf
echo "enter the directory address"
read address2
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
output_file="${address2}/${timestamp}_backup.tar.gz"
start_time=$(date +%s%N)
tar -czf "$output_file" -T backup.conf
status=$?
end_time=$(date +%s%N)
duration=$((end_time - start_time))
filesize=$(du -m "$output_file" | cut -f1)
log_file="backup.log"
now=$(date +"%Y-%m-%d %H:%M:%S")
if [ $status -eq 0 ]; then
     echo "[$now] SUCCESS: Backup created at $output_file, Size: ${filesize}MB, Duration: ${duration}ns" >> "$log_file"
else 
     echo "[$now] ERROR: Backup failed, Duration: ${duration}ns" >> "$log_file"
fi 
days_to_keep=7
find "$address2" -name "*.tar.gz" -type f -mtime +$days_to_keep -exec rm {} \;
