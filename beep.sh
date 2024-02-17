
mins=20
secs=60

for i in $(seq $mins -1 1)
do
    echo -n "$i, "
    sleep $secs
done

    echo beep
    say ok