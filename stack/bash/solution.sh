#!/usr/bin/env bash

# IFS=$’\n’
declare -a fail=( )

n=1
while read -r line
do
    data=$(echo -n "${line}"          | awk -F'[ ]' '{print($1)}')
    hash=$(echo -n "${line}"          | awk -F'[ ]' '{print($2)}')
    redo=$(echo -n "${data}" | md5sum | awk -F'[ ]' '{print($1)}')

    if [ "${hash}" != "${redo}" ]
    then fail+=("$data ${redo}")
    fi

    n=$((n + 1))
done < "${1}"

printf "%s\n" "${fail[@]}"
