#!/bin/bash

# Check if kicad is installed
kicad_version="$(kicad-cli --version)"
if [ -z "$kicad_version" ]; then
  echo "::error::Please make sure kicad is installed"
  exit 1
fi

# Parse all variables
file_path=""
type=""

while [[ "$#" -gt 0 ]]; do
    case $1 in
        --type) type="$2"; shift ;;
        *) file_path="$1" ;;
    esac
    shift
done

# Check if the file name is supplied.
if [ -z "$file_path" ]; then
  echo "::error::Please supply source file"
  exit 1
fi

# Check if the test type is supplied.
if [ -z "$type" ]; then
  echo "::error::Please supply type"
  exit 1
fi

# Get the file_name without file type
file_name="$(basename "$file_path" | rev | cut -d '.' -f 2- | rev)"

# Run test
case $type in
  erc) kicad-cli sch erc --exit-code-violations "$file_path" ;;
  drc) kicad-cli pcb drc --exit-code-violations "$file_path" ;;
  *)
    echo "::error::Type is not correct"
    exit 1
    ;;
esac

# Give error if the check has failed
if [ "$?" != "0" ]; then
  echo "Full ${type} report:"
  cat "${file_name}.rpt"
  echo "::error::Check failed."
  exit 1
fi