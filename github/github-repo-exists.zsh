# githubRepoExists <repo_name> - has binary output ( 0 or 1 )

function githubRepoExists() {    
    local projectName=${1:?"project name wasn't specified"}

    if gh repo view "$githubAccountName/$projectName" &>/dev/null 2>&1; then
        echo "1"
    else
        echo "0"
    fi
}
