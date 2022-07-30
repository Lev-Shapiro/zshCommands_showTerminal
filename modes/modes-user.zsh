# runUserMode - close spotify and vsc

function runUserMode() {
    if pgrep "Spotify" &>/dev/null 2>&1; then
        spotify quit &>/dev/null
        echo "${NC}Spotify: ${GREEN}Closing..."
    else
        echo "${NC}Spotify: ${ORANGE}is already closed"
    fi

    if pgrep "Electron" &>/dev/null 2>&1; then
        echo "${NC}Visual Studio Code: ${GREEN}Closing..."
        killall Electron &>/dev/null
    else
        echo "${NC}Visual Studio Code: ${ORANGE}is already closed"
    fi
}
