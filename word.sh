word=aab
	go_on=1
    tries=0
while [ $go_on -eq 1 ]
	do
    tries=$(expr $tries + 1)
	guess=
	  read -n 3 -p "What is guess: " guess
	guess=$(echo "$guess" | awk '{print toupper($0)}')
	state=
  for i in {0..2}
  do
    if [ "${word:i:1}" == "${guess:i:1}" ]
    then
      state=$state"🟩"
    elif [[ $word =~ "${guess:i:1}" ]]
    then
      state=$state"🟨"
    else
      state=$state"⬛️"
    fi
  done

  echo "  "$state

	  if [[ -z "$guess" || $tries == 3 ]] 
	  then 
	    echo failed
	    go_on=0 
	   
	  elif [ $guess == $word ]
	  then
	    echo -e "You won"
	    go_on=0
	  fi
done