# runDeveloperMode - opens project X in VSC, allowing to commit it using terminal. Adds music via Spotify

function runDeveloperMode() {
        paths=($(find ~/Documents -name "*$projectDirectoriesEnding" &&
                find ~/.oh-my-zsh/custom -maxdepth 1 -name "aliases.zsh"))

        showProjects

        echo -n "pick option: "
        read pathNumber
        Repository=${paths[pathNumber]}

        osascript "$rootCustomScriptsPath/apps/apps-open.scpt" "Spotify" "Visual Studio Code"
        osascript "$rootCustomScriptsPath/apps/apps-fullscreen.scpt" "Google Chrome" "Spotify" "Electron"

        spotifyPlayingStatus=$(spotify status | sed -n 1p)

        if [[ "$spotifyPlayingStatus" == *"paused"* ]]; then
                echo "Spotify: ${GREEN}playing music... "
                spotify play uri $spotifyDefaultPlaylist &>/dev/null
        else
                echo "Spotify: ${ORANGE}music is already running "
        fi

        code $Repository

        githubCreateCommits $Repository
}
