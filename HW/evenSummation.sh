#!/bin/bash

string=${@:1}
echo "Неупорядоченный набор чисел: ${numbers[@]}" 
IFS="," read -ra string1 <<<"$string"
even_sum=0

for num in "${string1[@]}" 
do
    if ((num % 2 == 0)); then 
        ((even_sum += num))  # Добавляем четное число к сумме 
    fi 
done 
 
echo "Сумма всех четных чисел: $even_sum"
