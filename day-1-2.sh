# Usage: ./day-1-2.sh | ./day-1-1.sh | grep 1 | wc -l

for i in `seq 3 2000`; do
  head -n $i day-1-1.input | tail -n 3 | sed 's/^/ + /' | xargs expr 0
done
