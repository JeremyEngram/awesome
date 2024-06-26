#!/usr/bin/env bash

omnihub_dir="$HOME/.local/share/omnihub"
bin_dir="$HOME/.local/share/bin"
# version="0.1.1"

# if ((BASH_VERSINFO[0] < 4)); then
#     printf '%s\n' "Error: This requires Bash v4.0 or higher. You have version $BASH_VERSION." 1>&2
#     exit 2
# fi

fn_confirm() {
    local item=$1
    read -rp "Do you want to remove $item? yes/y or no/n   " PANS
    ans=$(echo "$PANS" | cut -c 1-1 | tr "[:lower:]" "[:upper:]")
    echo $ans
}

# check if a dir exist. if not create it and add $HOME/omnihub path to config file
fn_checkDir() {
    if [[ -z $1 ]]; then
        echo "Specify the directory." >&2
        exit
    fi
    if [[ ! -d $1 ]]; then
        mkdir -p "$1"
        echo "$1 directory is created." >&2
    fi
}

fn_check_cmd() {
    if [ ! "$(command -v "$1")" ]; then
        echo "Please install $1" >&2
        exit
    fi
}

# create a symlink in bin
fn_create_symlink() {
    # find the name of repo
    repo_name=$1
    # add a symlink
    ln -sf "${omnihub_dir}/${repo_name}/${repo_name}" "${bin_dir}/${repo_name}"
}

fn_find_symlinks() {
    paths=$(find "$bin_dir" -type l)
    echo "$paths"
}

# Run git clone and create a symlink
fn_install() {
    fn_checkDir "$omnihub_dir"
    fn_checkDir "$bin_dir"
    fn_check_cmd git
    cd "$omnihub_dir" || exit
    url="https://github.com/jeremyengram/omnihub.git"
    repo="omnihub"
    { git clone "${url}" && fn_create_symlink "${repo}"; } || exit
    echo "${repo} installation completed."
    echo "Add the following to your your terminal config file, such as .zshrc or .bashrc."
    echo 'export PATH=$HOME/.local/share/bin:$PATH'
    echo "Try ${repo} -h or which ${repo}."
}

# Removes the omnihub symlinks and dir
fn_uninstall() {
    echo "Finding symlinks ..."

    if [[ $(fn_confirm symlinks) = "Y" ]]; then
        # mac doesn't have mapfile
        # mapfile -t links < <(fn_find_symlinks)
        links=($(fn_find_symlinks))
        for link in "${links[@]}"; do
            unlink "$link"
            echo "Removed the ${link} symlink."
        done
    fi

    if [[ $(fn_confirm omnihub-directory) = "Y" ]]; then
        echo "Uninstalling omnihub directory ..."
        rm -rf "$omnihub_dir"
        echo "Uninstalled omnihub directory."
        exit
    fi
}

fn_main() {
    if [ $# -eq 1 ]; then
        case $1 in
        "install")
            fn_install
            ;;
        "uninstall")
            fn_uninstall
            ;;
        esac
    else
        echo "Something wrong."
        exit 1
    fi
}

fn_main "$@"