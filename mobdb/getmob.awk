BEGIN {
  FS=","
  print("local mob = {}")
}

{
  printf("mob["$1"] = { [\"ironame\"] = \""$4"\", [\"kroname\"] = \""$3"\", [\"sprite\"] = \""$2"\", [\"items\"] = { ")
  for(i = 39; i <= 58; i = i+2) {
    j = i + 1
    if( $i != 0)
      printf(" ["$i"] = "($j/10000)" ,")
  }
  printf("} }\n")
}

END {
  print("return mob")
}
