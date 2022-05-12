BEGIN{
    FS=":";
    OFS="="
    print "name uid gid dir";
}
{
    print $1,$3,$4,$6,NR;
}
END {
print NR,"records"
}