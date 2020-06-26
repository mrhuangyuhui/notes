#! /bin/bash

function signal_handler {
   echo "Good bye."
}

trap signal_handler 0

