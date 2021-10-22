#!/data/data/com.termux/files/usr/bin/bash
#TEDITOR-RED
#Coded by Z3R07-RED on Oct 18 2021
#
#VARIABLES:
termux_path="/data/data/com.termux/files/usr/bin"
# kali_linux_path="/usr/bin" # No Disponible.

#universal_functions && universal_variables
if [[ -f "CS07/universal_functions" && -f "CS07/universal_variables" ]]; then
    source "CS07/universal_functions"
    source "CS07/universal_variables"
else
    echo -e "[ERROR]: \"universal_functions\", \"universal_variables\""
    echo "";exit 1
fi
#colors
if [[ -f "$colors" ]]; then
    source "$colors"
else
    unexpected_error
fi

#Directory
# if [[ ! -d "$log_directory" ]]; then
#	 mkdir $log_directory
# fi

#Directory
# if [[ ! -d "$tmp_directory" ]]; then
#	 mkdir "$tmp_directory"
# fi

#CTRL+C
trap ctrl_c INT

function ctrl_c(){
echo $(clear)
# rm -rf tmp/* 2>/dev/null
# rm -rf logs/* 2>/dev/null
echo "Program aborted."
tput cnorm 2>/dev/null
echo ""; exit 1
}

#FUNCTIONS:
function ncurses_utils(){
if [ ! "$(command -v tput)" ]; then
	echo -e "\n${Y}[I]${W} apt install ncurses-utils ...${RESET}"
	apt install ncurses-utils -y > /dev/null 2>&1
	sleep 1
fi
}

# dependencies
function dependencies(){
if [[ -d "$kali_linux_path" ]]; then
    ZEROAPT="apt-get" # No Disponible.
else
    ZEROAPT="apt"
	ncurses_utils
fi
tput civis; counter_dn=0
echo $(clear);sleep 0.3
printf "${R}┌──────────────────────────────────────┐${W}\n"
printf "${R}│      COMUNIDAD CLUB SECRETO 07       │${W}\n"
printf "${R}└──────────────────────────────────────┘${W}\n"
printf "\n${W}\e[1;36m$program_name - version $version${W}\n"
printf "${W}\e[1;32mCoded by ${W}\033[41;33;1m$author${W}${G} on $making${W}\n"
echo ""
sleep 0.2
spinner=("${Y}||" "${Y}//" "${Y}--" "${Y}OK")
spinner2=("${Y}||" "${Y}//" "${Y}--" "${R}..")
PKGS=(git python nano vim) # dependencies
for program in "${PKGS[@]}"; do
    if [ ! "$(command -v $program)" ]; then
		for SPMP in ${spinner2[@]}; do
			printf "\r${G}|${W}\033[41;37;1m%12s${W}${G}|>----------- [${W} ${SPMP} ${G}]${RESET}" $program
			sleep 0.2
		done
		sleep 1
		echo -e "\n"
        let counter_dn+=1
		echo -e "${Y}[i]${C} INSTALLING $program ${W}...${RESET}"
		echo ""
		$ZEROAPT install $program -y
		echo ""
	else
		for SPMP in ${spinner[@]}; do
			printf "\r${G}|${W}\033[41;37;1m%12s${W}${G}|>----------- [${W} ${SPMP} ${G}]${RESET}" $program
			sleep 0.2
		done
		sleep 0.3
		echo -e "\n"
    fi
done
sleep 1
echo $(clear);tput cnorm
}

internet_connection
dependencies
sleep 0.3
echo -e "\n${Y}[i]${C} INSTALLING phonenumbers${W} ..."
pip3 install phonenumbers

echo -e "\n${Y}[+]${C} Directory configuration .TEDITOR-RED${W} ..."
sleep 0.3
if [[ -d ".TEDITOR-RED" ]]; then
    cp -rf .TEDITOR-RED "$HOME" 2>/dev/null
    if [[ ! -d "$HOME/bin" ]]; then
        mkdir "$HOME/bin" 2>/dev/null
    fi
else
    unexpected_error
fi

echo -e "\n${Y}[+]${C} File configuration 'termux-file-editor'${W} ..."
if [[ -f "termux-file-editor" ]]; then
    if [[ -f "$HOME/bin/termux-file-editor" ]]; then
        mv "$HOME/bin/termux-file-editor" "$HOME/bin/termux-file-editor-$(randdata 6).old"
    fi
    cp "termux-file-editor" "$HOME/bin" 2>/dev/null
    chmod +x "$HOME/bin/termux-file-editor" 2>/dev/null
else
    unexpected_error
fi

echo -e "\n${C}[+]${G} Se ha instalado correctamente. ${W}"
echo ""
