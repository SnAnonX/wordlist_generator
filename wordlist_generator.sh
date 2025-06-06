#!/bin/bash

clear
echo "======================================="
echo "  Advanced Wordlist Generator by SN_AnonX11"
echo "======================================="

read -p "Enter base word (e.g. name): " base
filename="wordlist_${base}_advanced.txt"

# Common years, cities, common suffixes, top passwords
years=$(seq 1980 2025)
cities=("lahore" "karachi" "islamabad" "delhi" "multan" "peshawar" "quetta" "faisalabad")
suffixes=("123" "786" "2023" "2024" "999" "007" "111" "000" "321" "555")
specials=("!" "@" "#" "$" "%" "&" "*" "-" "_")
top_passwords=("123456" "password" "qwerty" "abc123" "letmein" "welcome" "iloveyou" "admin" "monkey" "login" "dragon" "passw0rd" "starwars" "football" "master" "hello" "freedom" "whatever" "qazwsx" "trustno1")

> "$filename"

echo "Generating advanced wordlist..."

# Base combinations
for year in $years; do
    echo "${base}${year}" >> "$filename"
    echo "${base}_${year}" >> "$filename"
    echo "${base}${year}!" >> "$filename"
    echo "${base}${year}@" >> "$filename"
    echo "${base}${year}#" >> "$filename"
done

for city in "${cities[@]}"; do
    echo "${base}${city}" >> "$filename"
    echo "${base}_${city}" >> "$filename"
    echo "${base}${city}123" >> "$filename"
done

for suffix in "${suffixes[@]}"; do
    echo "${base}${suffix}" >> "$filename"
    echo "${base}_${suffix}" >> "$filename"
    echo "${base}${suffix}!" >> "$filename"
done

for pass in "${top_passwords[@]}"; do
    echo "${base}${pass}" >> "$filename"
    echo "${base}_${pass}" >> "$filename"
done

# Uppercase, lowercase, capitalized
echo "${base^^}" >> "$filename"
echo "${base,,}" >> "$filename"
echo "${base^}" >> "$filename"

# Combine base word with special chars and numbers
for special in "${specials[@]}"; do
    for suffix in "${suffixes[@]}"; do
        echo "${base}${special}${suffix}" >> "$filename"
        echo "${base^}${special}${suffix}" >> "$filename"
        echo "${base^^}${special}${suffix}" >> "$filename"
    done
done

# Add base with top passwords with special chars
for special in "${specials[@]}"; do
    for pass in "${top_passwords[@]}"; do
        echo "${base}${special}${pass}" >> "$filename"
        echo "${base^}${special}${pass}" >> "$filename"
        echo "${base^^}${special}${pass}" >> "$filename"
    done
done

echo "Done! Wordlist saved in $filename"
lines=$(wc -l < "$filename")
echo "Total passwords generated: $lines"
