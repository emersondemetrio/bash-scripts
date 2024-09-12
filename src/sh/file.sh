file_size_bytes=$(stat -f%z "$1")

# Convert bytes to megabytes
file_size_mb=$(echo "scale=2; $file_size_bytes / 1048576" | bc)

echo "$file_size_mb MB"
