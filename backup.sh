#!/bin/bash

set -e

# Function to display the usage message
display_usage() {
  echo "Usage: $0 [-s source_folder]... [-d destination_folder] [-n name] [-l] [-h]"
  echo ""
  echo "Options:"
  echo "  -s source_folder    The source folder or file to be included in the backup (can be specified multiple times)"
  echo "  -d destination_folder The destination folder for the backup"
  echo "  -n name              The name of the backup"
  echo "  -l                   View the backup log"
  echo "  -h                   Display this help message"
  echo ""
}

# Function to create a new backup
create_backup() {
  # Initialize the list of source folders
  sources=()

  # Process the command line arguments
  while [ $# -gt 0 ]; do
    case "$1" in
      -s) shift; sources+=("$1");;
      -d) shift; destination="$1";;
      -n) shift; name="$1";;
      -h) display_usage; exit 0;;
      *) echo "Invalid option: $1"; display_usage; exit 1;;
    esac
    shift
  done

  # Check that the required arguments have been specified
  if [ -z "$sources" ] || [ -z "$destination" ] || [ -z "$name" ]; then
    echo "Error: missing required argument(s)"
    display_usage
    exit 1
  fi

  # Create the destination folder if it doesn't exist
  if [ ! -d "$destination" ]; then
    mkdir "$destination"
  fi

  # Create a zip file of the source folders and move it to the destination
  zip -r "$destination/$name.zip" "${sources[@]}"

  # Update the log file with the current date and time, the name of the backup, and the absolute paths of the source folders
  log_entry+="## $name\n"
  log_entry+="**Date:** $(date)\n\n"
  log_entry+="**Destination folder:**\n"
  log_entry+="\n\`\`\`\n"
  log_entry+="$(realpath "$destination")"
  log_entry+="\n\`\`\`\n"

  log_entry+="**Source folders:**\n"
  log_entry+="\n\`\`\`\n"
  for source in "${sources[@]}"; do
    log_entry+="$(realpath "$source")"
  done
  log_entry+="\n\`\`\`\n"

  log_entry+="**Files included:**\n"
  log_entry+="\n\`\`\`\n"
 for source in "${sources[@]}"; do
    # Get the list of files in the source folder and add them to the list of files
    files+=("$(find $(realpath "$source") -type f)")
  done

for file in $files; do
    log_entry+="$file\n"
done

  log_entry+="\n\`\`\`\n"


  echo -e "$log_entry" >> backup.log.md
}

# Function to view the backup log
view_log() {
  clear
  echo "===== Backup Log ====="
  cat backup.log.md
  echo ""
}

# Main loop
if [ "$1" = "-l" ]; then
  view_log
else
  create_backup "$@"
fi
