# . ~/hub_completion.sh
. ~/dotfiles/gitcompletion.sh
export soft=~/soft

# Exports the key value pairs in paths.yml if it exists
# E.g.
#    withpaths
#    unu head $t1
#    fslinfo $dwihcp
# (Would work nicely with direnv)
withpaths() {
    dir='.'
    if [ -n "${1}" ]; then
        dir=$(readlink -m $1)
    fi
    if [ -f "$dir/paths.yml" ]; then
        yml="$dir/paths.yml"
    elif [ -f "$dir/_inputPaths.yml" ]; then
        yml="$dir/_inputPaths.yml"
    else
        echo "$dir/paths.yml or $dir/_inputPaths.yml doesn't exist";
        return
    fi
    echo "Found $dir/paths.yml, exporting variables..."
    while IFS=":" read -r key val; do
        path="$(echo -e "${val}" | sed -e 's/^[[:space:]]*//')"
        if [ "$key" == "caseid" ]; then
            echo "export $key=$path"
            export $key=$path
            continue
        fi
        #patha=$(readlink -m $dir/$path)
        patha=$dir/$path
        echo "export $key=$patha"
        export $key=$patha
    done < $yml
}
eval "$(direnv hook bash)"
