#! /bim/bash -x
read -p "Enter a value of a:" a
read -p "Enter a value of b:" b
read -p "Enter a value of c:" c

r1=`expr $a \+ $b \* $c`


r2=`expr $a \* $b \+ $c`


r3=`expr $c \+ $a \/ $b`


r4=`expr $a \% $b \+ $c`

declare -A results
results['r1']=$r1
results['r2']=$r2
results['r3']=$r3
results['r4']=$r4



declare -A myResultArray
myResultArray[0]=${results[r1]}
myResultArray[1]=${results[r2]}
myResultArray[2]=${results[r3]}
myResultArray[3]=${results[r4]}
echo ${myResultArray[*]}

for ((i=0; i<4; i++))
do
for ((j=$i; j<4; j++))
do
if [ ${myResultArray[$i]} -lt ${myResultArray[$j]} ]
then
temp=${myResultArray[$i]}
myResultArray[$i]=${myResultArray[$j]}
myResultArray[$i]=$temp
fi
done
done
echo "Array after sorting: "
for ((i=0; i<4; i++))
do
echo ${myResultArray[$i]}
done
