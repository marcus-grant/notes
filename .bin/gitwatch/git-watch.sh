#/bin/bash
# BASH script to call git watch for this directory

# First find gitwatch
_watch_bin=''
if [ -e /opt/homebrew/bin/gitwatch ]; then
    _watch_bin='/opt/homebrew/bin/gitwatch'
elif [ -e /usr/local/bin/gitwatch ]; then
    _watch_bin='/usr/local/bin/gitwatch'
else
    echo "ERROR: gitwatch binary not found"
    exit 129
fi

if [ ! -z "${DIR_NOTE}" ]; then
    script_path=${BASH_SOURCE[0]}
    while [ -L "$script_path" ]; do # resolve $script_path until the file is no longer a symlink
    parent_dir=$( cd -P "$( dirname "$script_path" )" >/dev/null 2>&1 && pwd )
    script_path=$(readlink "$script_path")
    [[ $script_path != /* ]] && script_path=$parent_dir/$script_path # if $script_path was a relative symlink, we need to resolve it relative to the path where the symlink file was located
    done
    parent_dir=$( cd -P "$( dirname "$script_path" )" >/dev/null 2>&1 && pwd )
    dir_note="$(dirname "$parent_dir")"
    dir_note="$(dirname "$dir_note")"
    export DIR_NOTE=$dir_note
fi

eval $_watch_bin \
    # -r git@github.com:marcus-grant/notes \
    -r origin
    -b main
    -l 64 \
    $DIR_NOTE
