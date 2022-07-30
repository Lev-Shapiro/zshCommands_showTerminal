# openApp <app> - opens app <app>

function openApp() {
    osascript "$rootCustomScriptsPath/apps/apps-open.scpt" "$1"
}