# closeApp <app> - closes app <app>

function closeApp() {
    osascript "$rootCustomScriptsPath/apps/apps-close.scpt" "$1"
}