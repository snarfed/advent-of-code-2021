# Usage: ./day-1-1.sh | grep 1 | wc -l

last='NA'
for i in `cat day-1-1.input`; do
  expr $i \> $last
  last=$i
done
