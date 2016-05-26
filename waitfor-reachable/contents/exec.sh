#!/usr/bin/env bash
set -eu

host=$1

declare -i count=0 max=$RD_CONFIG_MAXTRY seconds=$RD_CONFIG_INTERVAL

progress_tic() {
  tic=$1
  if [[ -t 1 ]]
  then  printf -- "%s" "$tic" 
  else  printf -- "%s\n" "$tic"
  fi
}

until ( $RD_CONFIG_COMMAND )
do
    sleep $seconds
    progress_tic .

    # error out if reached max attempts.
    (( count == max )) && {
       echo >&2 "Reached max attempts to check $host. Exiting."
       exit 3
    }

    (( count += 1 ))
done

echo "OK: $host is reachable."


