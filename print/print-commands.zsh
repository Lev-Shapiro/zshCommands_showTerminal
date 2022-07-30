# customHelp - prints all custom commands

function customHelp() {
    i=1
    for filePath in $zshFilePaths; do
        commandDescription=$(head -n 1 "$filePath" | cut -c 3-)

        a="${BLUE}$commandDescription" # add color blue to all text
        a="${a/</${ORANGE}<}" # add color orange to text after <
        a="${a/-/${NC}-}" # add NO COLOR to text after -
        
        echo "$a"

        i=$((i + 1))
    done
}
