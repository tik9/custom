subject='hello world'
from=user153015@gmail.com
pass=xx
to=$from

s-nail -v -s "$subject" \
    -S smtp-use-starttls \
    -S ssl-verify=ignore \
    -S smtp-auth=plain \
    -S smtp=smtp://smtp.gmail.com:587 \
    -S from="$from" \
    -S smtp-auth-user=$from \
    -S smtp-auth-password=$pass \
    -S ssl-verify=ignore \
    $to
