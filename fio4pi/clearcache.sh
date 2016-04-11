while sleep 0.25
do
  sudo sh -c 'echo 1 > /proc/sys/vm/drop_caches'
  echo "Cache flushed"
done

