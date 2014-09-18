#!/bin/sh

if ! ls mob_db.txt &> /dev/null; then
  echo "Could not find mob_db.txt. Downloading from eAthena's repository"
  wget "https://raw.githubusercontent.com/eathena/eathena/master/db/mob_db.txt"
fi

cat "mob_db.txt" | egrep --color=never "^[0-9]" | awk -f"getmob.awk" > dmobdb.lua
