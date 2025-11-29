#!/bin/zsh


# Input and output files
BASH_HISTORY="$HOME/.bash_history"
ZSH_HISTORY="$HOME/.zsh_history"


if [[ ! -f "$BASH_HISTORY" ]]; then
    echo "File $BASH_HISTORY does not exist!"
    exit 2
fi


# Read each line from bash history and append to zsh history in proper format
while IFS= read -r line; do
    # Skip empty lines
    [[ -z "$line" ]] && continue
    # Append entry in zsh format
    echo ":$(date +%s):0;$line" >> "$ZSH_HISTORY"
done < "$BASH_HISTORY"

echo "Conversion finished. Result appended to $ZSH_HISTORY"
