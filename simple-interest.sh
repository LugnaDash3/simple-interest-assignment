#!/usr/bin/env bash
# simple-interest.sh
# Usage: ./simple-interest.sh <principal> <rate_percent> <time_years>

if [ "$#" -ne 3 ]; then
  echo "Usage: $0 <principal> <rate_percent> <time_years>"
  exit 1
fi

P="$1"
R="$2"
T="$3"

# Validate numeric inputs (basic)
re='^[0-9]+([.][0-9]+)?$'
if ! [[ $P =~ $re && $R =~ $re && $T =~ $re ]]; then
  echo "Error: all arguments must be non-negative numbers."
  exit 1
fi

# Calculate simple interest = (P * R * T) / 100
# Use bc for decimals
SI=$(printf "%s\n" "scale=4; ($P * $R * $T) / 100" | bc -l)

echo "Principal: $P"
echo "Rate (% per year): $R"
echo "Time (years): $T"
echo "Simple Interest: $SI"
