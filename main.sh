#!/bin/bash
alphabet=() #declare an alphabet array
#reading from file and storing in array
while IFS= read -r line
do
    alphabet+=("$line")
    i=$((i+1))
done < 'PRINTING NAMES/output.txt'
#
read -p "Enter your name(UPPERCASE NO SPACE): " -r name
numchar=$(echo -n "$name" | wc -c)
letter=()
for (( i=0; i<numchar; i++ )){
    char=$(echo -n "$name" | cut -c $((i+1)))
    letter+=("$(printf "%d\n" "'$char")")
}
echo $((letter[0]-65))
#char=$(((letter[k]-65)*5))#FOR GETTING THE PATTERN PER LINE...
for ((j=0; j<5; j++)){
    for ((k=0; k<numchar; k++)){
        char=$(((letter[k]-65)*5))
        echo -n "${alphabet[char+j]}"
        echo -n " "
    }
    echo ""
}