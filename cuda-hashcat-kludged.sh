#!/bin/bash



if [ $# -eq 0 ]
	then
		echo
		echo
		echo "syntax: \"cudaHashcat-script ./path/to/hash-file.txt <number for hashcat hash type>\""
		echo
		echo "See \"https://hashcat.net/wiki/doku.php?id=example_hashes\" to find your hash type."
		echo
		echo
		exit
fi

HASHCATBIN=/opt/cudaHC/hashcat-3.30/hashcat64.bin
OUTFILE=/sand/found-passwords-`date +%F_%H-%M-%S`.txt

echo "This will output the file \"$OUTFILE\"."
# echo "This will output the file \"/sand/found-passwords-DATETIME.txt\","
# echo "where DATETIME is the date and time this script was invoked."

touch $OUTFILE

#sleep 3

$HASHCATBIN -m $2 -a 0 -o $OUTFILE $1 /sand/wordlist.txt

#EOF
