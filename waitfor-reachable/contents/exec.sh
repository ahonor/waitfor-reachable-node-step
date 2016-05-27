#!/usr/bin/env bash
set -eu

host=$1

declare -i count=0 max=$RD_CONFIG_MAXTRY seconds=$RD_CONFIG_INTERVAL

progress_tic() {
  local tic=$1
  if [[ -t 1 ]]
  then  printf -- "%s" "$tic" 
  else  printf -- "%s\n" "$tic"
  fi
}

echo "Running command '$RD_CONFIG_COMMAND' every $seconds seconds until host is reachable up to $max tries..."
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


