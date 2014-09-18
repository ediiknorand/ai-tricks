BEGIN {
  FS=",|\t"
}

$1 !~ /^\/\/|^$|\/\*|\*\//{
  if(context == 0) {
    if($1 ~ "^function$|^-$")
      exit
    if($5 ~ "script|shop|duplicate")
      printf("npc[\"%s(%d,%d,%d,%d)\"] = {[\"name\"] = \"%s\"}\n", $1, $2, $3, $4, $7, $6)
    if($5 ~ "warp")
      printf("npc[\"%s(%d,%d,%d,%d)\"] = {[\"name\"] = \"%s\", [\"to\"] = \"%s,%d,%d\"}\n", $1, $2, $3, $4, 45, $6, $9, $10, $11)
  }
}

/{|\/\*/ {
  context += 1
}

/}|\/\*/ {
  context -= 1
}

