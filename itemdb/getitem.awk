BEGIN {
  FS=","
  print("local item = {}")
}

{
  print("item["$1"] = { [\"aname\"] = \""$2"\", [\"name\"] = \""$3"\" }")
}

END {
  print("return item")
}
