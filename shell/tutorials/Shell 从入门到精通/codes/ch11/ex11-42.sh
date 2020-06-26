#! /bin/awk -f

BEGIN {
   system("ls > filelist")
   
   while(getline < "filelist" > 0)
   {
      print $1
   }
}
   
