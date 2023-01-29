#/bin/bash

script_path=${BASH_SOURCE[0]}
while [ -L "$script_path" ]; do # resolve $script_path until the file is no longer a symlink
parent_dir=$( cd -P "$( dirname "$script_path" )" >/dev/null 2>&1 && pwd )
script_path=$(readlink "$script_path")
[[ $script_path != /* ]] && script_path=$parent_dir/$script_path # if $script_path was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
parent_dir=$( cd -P "$( dirname "$script_path" )" >/dev/null 2>&1 && pwd )
_service_file='/Users/marcus/Library/LaunchAgents/com.github.gitwatch.notes.plist'
cp "${parent_dir}/gitwatch.plist" $_service_file
launchctl load "$_service_file"
