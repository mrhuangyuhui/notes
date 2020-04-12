#! /bin/awk -f

BEGIN {
   while("who" | getline) n++
   printf("There %d online users.\n",n)
}
