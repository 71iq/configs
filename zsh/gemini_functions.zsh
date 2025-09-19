export GEMINI_API_KEY=$(cat /home/ehab/.config/.gemini_api_key)
# Function to generate a git commit message using Gemini
gemcmsg() {
  # Store the git diff output in a variable
  CHANGES=$(git diff --staged)

  if [ -z "$CHANGES" ]; then
    echo "No staged changes to commit."
    return 1
  fi

  echo "Generating commit message with Gemini..."
  # Now pass the full prompt, including the changes, to Gemini
  gemini -p "Generate a concise and descriptive git commit message for the following changes:

${CHANGES}"
}

# Function to explain code using Gemini (supports files and directories)
gemexp() {
  if [ -z "$1" ]; then
    echo "Usage: gemini_explain_code <file_or_directory_path>"
    return 1
  fi

  TARGET_PATH="$1"

  if [ -f "$TARGET_PATH" ]; then
    CODE_CONTENT=$(cat "$TARGET_PATH")
    echo "Explaining code in $TARGET_PATH with Gemini..."
    gemini -p "Explain the following code in detail:

```
${CODE_CONTENT}
```"
  elif [ -d "$TARGET_PATH" ]; then
    echo "Explaining code in directory $TARGET_PATH with Gemini (processing each file)..."
    for FILE_PATH in "$TARGET_PATH"/*; do
      if [ -f "$FILE_PATH" ]; then
        echo "Processing file: $FILE_PATH"
        CODE_CONTENT=$(cat "$FILE_PATH")
        gemini -p "Explain the following code in detail:

```
${CODE_CONTENT}
```"
      fi
    done
  else
    echo "Error: Path not found or is not a regular file or directory: $TARGET_PATH"
    return 1
  fi
}

# Function to suggest refactoring for code using Gemini (supports files and directories)
gemref() {
  if [ -z "$1" ]; then
    echo "Usage: gemini_refactor_code <file_or_directory_path>"
    return 1
  fi

  TARGET_PATH="$1"

  if [ -f "$TARGET_PATH" ]; then
    CODE_CONTENT=$(cat "$TARGET_PATH")
    echo "Suggesting refactoring for code in $TARGET_PATH with Gemini..."
    gemini -p "Suggest refactoring improvements for the following code. Focus on readability, maintainability, and performance:

```
${CODE_CONTENT}
```"
  elif [ -d "$TARGET_PATH" ]; then
    echo "Suggesting refactoring for code in directory $TARGET_PATH with Gemini (processing each file)..."
    for FILE_PATH in "$TARGET_PATH"/*; do
      if [ -f "$FILE_PATH" ]; then
        echo "Processing file: $FILE_PATH"
        CODE_CONTENT=$(cat "$FILE_PATH")
        gemini -p "Suggest refactoring improvements for the following code. Focus on readability, maintainability, and performance:

```
${CODE_CONTENT}
```"
      fi
    done
  else
    echo "Error: Path not found or is not a regular file or directory: $TARGET_PATH"
    return 1
  fi
}

# Function to generate unit tests for code using Gemini (supports files and directories)
gemtests() {
  if [ -z "$1" ]; then
    echo "Usage: gemini_generate_tests <file_or_directory_path>"
    return 1
  fi

  TARGET_PATH="$1"

  if [ -f "$TARGET_PATH" ]; then
    CODE_CONTENT=$(cat "$TARGET_PATH")
    echo "Generating unit tests for $TARGET_PATH with Gemini..."
    gemini -p "Generate comprehensive unit tests for the following code. Include test cases for common scenarios, edge cases, and error handling:

```
${CODE_CONTENT}
```"
  elif [ -d "$TARGET_PATH" ]; then
    echo "Generating unit tests for code in directory $TARGET_PATH with Gemini (processing each file)..."
    for FILE_PATH in "$TARGET_PATH"/*; do
      if [ -f "$FILE_PATH" ]; then
        echo "Processing file: $FILE_PATH"
        CODE_CONTENT=$(cat "$FILE_PATH")
        gemini -p "Generate comprehensive unit tests for the following code. Include test cases for common scenarios, edge cases, and error handling:

```
${CODE_CONTENT}
```"
      fi
    done
  else
    echo "Error: Path not found or is not a regular file or directory: $TARGET_PATH"
    return 1
  fi
}

# Function to generate documentation for code using Gemini (supports files and directories)
gemdocs() {
  if [ -z "$1" ]; then
    echo "Usage: gemini_generate_docs <file_or_directory_path>"
    return 1
  fi

  TARGET_PATH="$1"

  if [ -f "$TARGET_PATH" ]; then
    CODE_CONTENT=$(cat "$TARGET_PATH")
    echo "Generating documentation for $TARGET_PATH with Gemini..."
    gemini -p "Generate detailed documentation for the following code. Include a description of its purpose, usage examples, and explanations of key functions/classes:

```
${CODE_CONTENT}
```"
  elif [ -d "$TARGET_PATH" ]; then
    echo "Generating documentation for code in directory $TARGET_PATH with Gemini (processing each file)..."
    for FILE_PATH in "$TARGET_PATH"/*; do
      if [ -f "$FILE_PATH" ]; then
        echo "Processing file: $FILE_PATH"
        CODE_CONTENT=$(cat "$FILE_PATH")
        gemini -p "Generate detailed documentation for the following code. Include a description of its purpose, usage examples, and explanations of key functions/classes:

```
${CODE_CONTENT}
```"
      fi
    done
  else
    echo "Error: Path not found or is not a regular file or directory: $TARGET_PATH"
    return 1
  fi
}

# Function to send piped input to Gemini
gempipe() {
  if [ -t 0 ]; then # Check if stdin is a terminal (i.e., not piped)
    echo "Usage: echo \"your text\" | gemini_pipe_input \"Your prompt here\""
    echo "Or: cat your_file.txt | gemini_pipe_input \"Your prompt here\""
    return 1
  fi

  PROMPT_PREFIX="$1"
  if [ -z "$PROMPT_PREFIX" ]; then
    PROMPT_PREFIX="Process the following input:"
  fi

  INPUT_CONTENT=$(cat /dev/stdin)

  echo "Sending piped input to Gemini..."
  gemini -p "${PROMPT_PREFIX}

${INPUT_CONTENT}"
}
