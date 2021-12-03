# Usage: ./day-1-1.sh < day-1.input | grep 1 | wc -l

last='NA'
while read -r i; do
  expr $i \> $last
  last=$i
done
