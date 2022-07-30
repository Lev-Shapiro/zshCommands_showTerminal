# removeProject <project name> - remove repository + directory at ~/Documents/projects

function removeProject() {
    local projectName=${1:?"Project name wasn't specified"}

    projectName+="$projectDirectoriesEnding"
    githubRepository="$githubAccountPath/$projectName"

    repoExists=$(githubRepoExists "$projectName")

    if [ "$repoExists" = "0" ]; then
        echo "${NC}github: ${RED}no such repository: $githubRepository"
    else
        gh repo delete $githubRepository --confirm &>/dev/null
        rm -rf "$projectsPath/$projectName"

        echo "${NC}github: ${GREEN}removed repository: $githubRepository"
        echo "${NC}github: ${GREEN}removed folder: $projectsPath/$projectName"
    fi
}
