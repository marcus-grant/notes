#/bin/bash

_service_name='com.github.gitwatch.note'
_service_file="/Users/marcus/Library/LaunchAgents/${_service_name}"
unload_flag=false
script_path=''
parent_dir=''

function setParentDir {
    script_path=${BASH_SOURCE[0]}
    while [ -L "$script_path" ]; do # resolve $script_path until the file is no longer a symlink
    parent_dir=$( cd -P "$( dirname "$script_path" )" >/dev/null 2>&1 && pwd )
    script_path=$(readlink "$script_path")
    [[ $script_path != /* ]] && script_path=$parent_dir/$script_path # if $script_path was a relative symlink, we need to resolve it relative to the path where the symlink file was located
    done
    parent_dir=$( cd -P "$( dirname "$script_path" )" >/dev/null 2>&1 && pwd )
}

function load {
    if launchctl list | grep -q "$_service_name"; then
        echo "Gitwatch note service '${_service_name}' already loaded!"
        echo "Exiting..."
        exit 0
    else
        echo "Loading ${parent_dir}/gitwatch.plist to ${_service_file}"
        cp "${parent_dir}/gitwatch.plist" $_service_file
        launchctl load "$_service_file"
        # launchctl enable $_service_file
        # launchctl kickstart -k $_service_file
    fi
}

function unload {
    # rm _service_file
    echo "Unloading launchd service $_service_name"
    launchctl unload $_service_file
    if [ -e "${_service_file}" ]; then
        rm $_service_file
    fi
}

while getopts ':u' flag; do
    case "${flag}" in
        u) unload_flag=true   ;;
        *) unload_flag=false  ;;
    esac
done
if "$unload_flag"; then
    unload
else
    setParentDir
    load
fi

unset unload_flag script_path parent_dir _service_file

exit 0
