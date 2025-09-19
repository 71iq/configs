replacet() {
  if [[ $# -ne 2 ]]; then
    echo "Usage: replace <text_to_replace> <replacement_text>"
    return 1
  fi
  find ./ -type f -print0 | xargs -0 sed -i '' "s/$1/$2/g"
}

renamef() {
  if [[ $# -ne 2 ]]; then
    echo "Usage: rename_occurrence <text_to_replace> <replacement_text>"
    return 1
  fi
  find ./ -depth -type f -name "*$1*" -print0 | while IFS= read -r -d $'\0' file; do
    local dir
    local fname
    dir=$(dirname "$file")
    fname=$(basename "$file")
    new_fname=$(echo "$fname" | sed "s/$1/$2/g")
    if [[ "$fname" != "$new_fname" ]]; then
      mv -v "$file" "$dir/$new_fname"
    fi
  done
}

findline() {
  if [[ $# -ne 1 ]]; then
    echo "Usage: search_occurrence <text_to_search>"
    return 1
  fi
  grep --color=auto -rnI "$1" .
}

printfiles_robust() {
  local target_dir="."

  if [[ $# -gt 1 ]]; then
    echo "Usage: printfiles_robust [directory_path]"
    echo "If no directory_path is provided, uses the current directory."
    return 1
  elif [[ $# -eq 1 ]]; then
    if [[ -d "$1" ]]; then
      target_dir="$1"
    else
      echo "Error: '$1' is not a valid directory."
      return 1
    fi
  fi

  echo "Searching in directory: $target_dir"
  echo ""

  find "$target_dir" -type f -print0 | while IFS= read -r -d $'\0' file; do
    echo "##################################################"
    echo "### FILE: $file"
    echo "##################################################"
    cat "$file"
    echo
    echo "### EOF: $file"
    echo "##################################################"
    echo ""
  done
}

alias printfiles='printfiles_robust'


input_to_file() {
  if [[ -z "$1" ]]; then
    echo "Usage: input_to_file <string>" >&2
    return 1
  fi
  local input_string="$1"
  local output_file="$HOME/input.txt"
  echo -n "$input_string" > "$output_file"
  cr
}
alias input='input_to_file'

topdf() {
  setopt LOCAL_OPTIONS NULL_GLOB
  local exts=("docx" "doc" "odt" "pptx" "ppt" "odp" "xlsx" "xls" "ods")
  local files=()

  for ext in "${exts[@]}"; do
    for file in *."$ext"; do
      [[ -e "$file" ]] && files+=("$file")
    done
  done

  if [[ ${#files[@]} -eq 0 ]]; then
    echo "No matching files found in the current directory."
    return 0
  fi

  echo "The following files will be converted to PDF and deleted:"
  for f in "${files[@]}"; do echo "  $f"; done

  echo -n "Are you sure you want to continue? (y/N): "
  read -r confirm
  if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
    echo "Aborted."
    return 1
  fi

  for file in "${files[@]}"; do
    echo "Converting: $file"
    if libreoffice --headless --convert-to pdf "$file"; then
      echo "Removing: $file"
      rm "$file"
    else
      echo "❌ Failed to convert: $file"
    fi
  done
}