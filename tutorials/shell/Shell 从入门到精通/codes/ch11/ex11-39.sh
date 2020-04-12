#! /bin/awk -f

{
  printf("%s\t%d\t%d\t%d\t%d\t%d\n",$1,$2,$3,$4,$5,($2 + $3 + $4 + $5))
}
