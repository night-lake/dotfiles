#!/usr/bin/env bash

black="\033[30m"
red="\033[31m"
green="\033[32m"
yellow="\033[33m"
blue="\033[34m"
pink="\033[35m"
cyan="\033[36m"
white="\033[37m"
text="\033[0;39m"

italic="\e[3m"
bold="\e[1m"
underline="\e[4m"
normal="\e[0m"

global TASK_COUNT=0

function yes_or_no {
    while true; do
        read -p "$* [y/n]: " yn
        case $yn in
            [Yy]*) return 0  ;;  
            [Nn]*) echo -e "${red}${bold}EXIT:${normal}${text} Please mount the home partition and try again" ; return  1 ;;
        esac
    done
}

function create_task {
    TOTAL_TASKS=6
    ((TASK_COUNT=TASK_COUNT+1))
	local LABEL=$1

	echo -e "${blue}${bold}:: ${normal}${text} Step ${TASK_COUNT}/${TOTAL_TASKS} | ${bold}${LABEL}${normal}"

	$2

	echo -e "${green}${bold}:: ${normal}${text} Step ${TASK_COUNT}/${TOTAL_TASKS} | ${bold}${LABEL}${normal}"
	echo -e ""
}

function theme_tty {
	echo "tty!"
}

function theme_grub {
	echo "grub"
}

function plymouth {

}

function gtk2_3 {

}

function run_install {
	echo -e ""

	create_task "TTY" theme_tty
	create_task "Grub" theme_grub
	create_task "Window Manager & Related Packages" install_wm
    create_task "Userspace" install_userspace
    create_task "Package Addons" install_package_addons
    create_task "Prepare Dotfiles" copy_dotfiles 

	echo -e "${green}${bold}DONE:${normal}${text} Run ${italic}install_ctp.sh${normal} from the dotfiles folder to install Catppuccin"
    echo -e "${blue}${bold}NOTICE:${normal}${text} It is recommended to reboot into the working system BEFORE installing Catppuccin"

}


echo -e "${pink}${bold}
           __  ____     _______  _____  _    _  _____ _____ _   _ 
     /\   |  \/  \ \   / /  __ \|  __ \| |  | |/ ____|_   _| \ | |
    /  \  | \  / |\ \_/ /| |__) | |__) | |  | | |      | | |  \| |
   / /\ \ | |\/| | \   / |  ___/|  ___/| |  | | |      | | | . ` |
  / ____ \| |  | |  | |  | |    | |    | |__| | |____ _| |_| |\  |
 /_/    \_\_|  |_|  |_|  |_|    |_|     \____/ \_____|_____|_| \_|
${normal}${text}
"

echo -e "${bold} by Amelia Rose (https://github.com/night-lake)${normal}"
echo -e "${cyan}${bold}INFO${normal}${text}: This script is responsible for DEPLOYING the packages on the target machine,"
echo -e "it DOES NOT deploy Catppuccin (see ${italic}install_ctp.sh${normal}) OR prepare the dotfiles (use ${italic}stow .${normal} for that)"
echo -e ""

if [  $(whoami) != "root" ]; then
	echo -e "${bold}${yellow}WARNING${text}${normal}: Please ENSURE that your home partition is MOUNTED and in ${italic}fstab${normal} before continuing."
	yes_or_no "Have you mounted the home partition?" && run_install
else
	echo -e "${red}${bold}EXIT:${normal}${text} Please rerun the script as a normal user!"
fi