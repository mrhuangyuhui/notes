#! /bin/awk -f

BEGIN {
   print "Scores list"
}

{
   printf ("%s\t%d\t%d\t%d\t%d\t%d\n",$1,$2,$3,$4,$5,($2 + $3 + $4 + $5))
   total+=$2 + $3 + $4 + $5
}

END {
   average=total/NR
   sum=sprintf("Total: %d students, average: %.2f",NR,average)
   print sum
}
