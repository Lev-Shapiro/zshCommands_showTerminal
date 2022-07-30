# showProjects - show projects at ~/Documents + aliases.zsh file

function showProjects() {
    paths=($(find ~/Documents -name "*$projectDirectoriesEnding" && 
    find ~/.oh-my-zsh/custom -maxdepth 1 -name "aliases.zsh"))

    i=1

    for dirPath in $paths; do
        echo "$i) $dirPath"

        i=$((i + 1))
    done
}
