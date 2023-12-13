# default timeout
timeout_mins=2
# while testing your script, making changes, you want this to be something like 1 or 2
sec_per_min=30

# check for command line input
if [ 0 -ne $# ]
then
    # assign the first command line param, no check, if it is a number, though!
    timeout_mins=$1
fi

for i in $(seq $timeout_mins -1 1)
do
    echo -n "$i, "
    sleep $sec_per_min
done

    printf \\a
    echo beep
    say ok