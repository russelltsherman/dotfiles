#!/usr/bin/env bash

# Returns 0 if the given item (needle) is in the given array (haystack); returns 1 otherwise.
#
# USAGE:
#   arr::contains "1" "1 2 3"
#
# EXAMPLES:
#
# arr::contains "1" "1 2 3"
# Returns: 0
#
arr::contains() {
  local -r needle="$1"
  shift
  local -ra haystack=("$@")

  local item
  for item in "${haystack[@]}"; do
    if [[ "$item" == "$needle" ]]; then
      return 0
    fi
  done

  return 1
}

# Joins the elements of the given array into a string with the given separator between each element.
#
# USAGE:
#   arr::join delimiter list of strings
#
# EXAMPLES:
#
# arr::join , a b c d
# Returns: a,b,c,d
#
# arr::join , a "b c" d
# Returns: a,b c,d
#
# arr::join / var local tmp
# Returns: var/local/tmp
#
# arr1=('a' 'b' 'c')
# arr::join , $arr1
# Returns: a,b,c
#
arr::join() {
  local IFS="$1"
  shift
  echo "$*"
}

# Adds the given $prefix to the beginning of each string element in the given $array
#
# Examples:
#
# array_prepend "P" "a" "b" "c"
#   Returns: ("Pa" "Pb" "Pc")
#
# Hint:
# When calling this function, use the following construction: ary=( $(array_prepend "P" "a" "b" "c") )
#
# Sources:
# - https://stackoverflow.com/a/13216833/2308858
#
arr::prepend() {
  local -r prefix="$1"
  shift 1
  local -ar ary=($@)

  updated_ary=( "${ary[@]/#/$prefix}" )
  echo ${updated_ary[*]}
}

# Splits the given $string into an array of elements based on the given $separator
#
# Examples:
#
# array_split "," "a,b,c"
#   Returns: ("a" "b" "c")
#
# Hint:
# When calling this function, use the following construction: ary=( $(array_split "," "a,b,c") )
#
# Sources:
# - https://stackoverflow.com/a/15988793/2308858
#
arr::split() {
  local -r separator="$1"
  local -r str="$2"
  local -a ary=()

  IFS="$separator" read -a ary <<<"$str"

  echo ${ary[*]}
}

# Create a union of two or more arrays
#
# USAGE:
#   arr::union [arr1[ arr2[ ...]]]
#
# EXAMPLE:
#   $ arr1=('a' 'b' 'c')
#   $ arr2=('b' 'c' 'd')
#   $ arr3=('c' 'd' 'e')
#   $ arr::union $arr1 $arr2 $arr3
#   Returns: a b c d e
#
arr::union() {
  typeset -U sections=("$@")
  echo $sections
}
