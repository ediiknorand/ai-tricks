#" /bin/sh

if ! ls item_db.txt &> /dev/null; then
  echo "Could not find item_db.txt. Downloading from eAthena's repository..."
  wget "https://raw.githubusercontent.com/eathena/eathena/master/db/item_db.txt"
fi

cat "item_db.txt" | egrep --color=never "^[0-9]" | awk -f getitem.awk > ditemdb.lua
