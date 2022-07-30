# createProject <project name> - initialize github repository with project name and clone it to ~/Documents/projects

function createProject() {
    local projectName=${1:?"Project name wasn't specified"}

    cd $projectsPath

    projectName+="$projectDirectoriesEnding"

    if [ -f "${projectsPath}/${projectName}" ]; then
        echo -e "project: ${RED}already exists"
        return 0
    fi

    repoExists=$(githubRepoExists "$projectName")

    if [ "$repoExists" = "0" ]; then
        gh repo create $projectName --private &>/dev/null
        echo "${NC}github: ${GREEN}created new repository"
    else
        echo "${NC}github: ${RED}project with currently specified name already exists"
        return 0
    fi

    git clone "$githubAccountPath/$projectName.git" &>/dev/null

    echo "${NC}github: ${GREEN}saved project at: $projectsPath/$projectName"

    cd $projectName

    git init &>/dev/null
    git branch -M "development" &>/dev/null
    cp $projectsPath/default_files/.gitignore .
}
