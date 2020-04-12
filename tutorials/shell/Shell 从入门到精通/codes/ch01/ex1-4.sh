#-----------------------------/chapter1/ex1-4.sh------------------
#!/bin/bash

#输出参数索引
echo "OPTIND starts at $OPTIND"
#接收参数
while getopts ":pq:" optname
   do
   case "$optname" in
      "p")
         echo "Option $optname is specified"
         ;;
      "q")
         echo "Option $optname has value $OPTARG"
         ;;
      "?")
         echo "Unknown option $OPTARG"
         ;;
      ":")
         echo "No argument value for option $OPTARG"
         ;;
      *)
         # Should not occur
         echo "Unknown error while processing options"
         ;;
   esac
   echo "OPTIND is now $OPTIND"
done
