# githubCreateCommits <repo_name> - creates commit for repository

function githubCreateCommits() {
    local projectName=${1:?"project name wasn't specified"}

    while :; do
        echo "${NC}---------------------"
        echo "PUSHING TO GITHUB"
        echo "---------------------"

        commitDataFile=".git/COMMIT_EDITMSG"

        if [ -f "$commitDataFile" ]; then
            commitName=$(head -1 .git/COMMIT_EDITMSG)

            echo "current commit: $commitName"

            echo "---------------------\n"
        fi

        vared -p 'Commit name: ' -c commitName
        vared -p 'Commit description: ' -c commitDescription

        cd $projectName
        git add .
        git commit -m $commitName -m $commitDescription
        git push -u origin development
    done
}
