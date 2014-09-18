#!/bin/sh

if ! ls npc-list.txt &> /dev/null; then
  echo "Could not find npc-list.txt. Downloading and generating from eAthena's repository..."
  wget "https://raw.githubusercontent.com/eathena/eathena/master/npc/scripts_athena.conf" -O - | grep "^npc: " | cut -d" " -f2- > npc-list.txt
  wget "https://raw.githubusercontent.com/eathena/eathena/master/npc/scripts_guild.conf" -O - | grep "^npc: " | cut -d" " -f2- >> npc-list.txt
  wget "https://raw.githubusercontent.com/eathena/eathena/master/npc/scripts_jobs.conf" -O - | grep "^npc: " | cut -d" " -f2- >> npc-list.txt
  wget "https://raw.githubusercontent.com/eathena/eathena/master/npc/scripts_warps.conf" -O - | grep "^npc: " | cut -d" " -f2- >> npc-list.txt
fi

while read i; do
  if ! ls "$i" &> /dev/null ; then
  echo "Downloading $i"
  filepath="$(echo "$i" | rev | cut -d"/" -f2- | rev)"
  mkdir -p "${filepath}"
  wget "https://raw.githubusercontent.com/eathena/eathena/master/"$i -O "$i" -q
  fi
done < "npc-list.txt"

echo "local npc = {}" > "npcdb.lua"
while read i; do
  cat "$i" | awk -f getnpc.awk >> "npcdb.lua"
done < "npc-list.txt"
echo
echo "return npc" >> "npcdb.lua"
