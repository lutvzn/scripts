#!/bin/sh
main() {
    function0() {
        echo "Exiting..."
        exit
    }
    function1() {
        echo "Debian"
        bash <(curl -s https://raw.githubusercontent.com/0xLCT/scripts/master/shell/linux/deb/toolsDeb.sh)
    }
    function2() {
        echo "Redhat"
        bash <(curl -s https://raw.githubusercontent.com/0xLCT/scripts/master/shell/linux/rh/toolsRh.sh)
    }
    function5() {
        echo "Setup zsh"
        bash <(curl -s https://raw.githubusercontent.com/0xLCT/scripts/master/shell/linux/zshsetup.sh)
    }

    function6() {
        echo "[6] Replace mkfs.btrfs with wrapper"
        bash <(curl -s https://raw.githubusercontent.com/lutvzn/scripts/master/shell/linux/mkfsbtrfswrapper.sh)
    }

    function9() {
        echo "[9] Flatpaks choosen"
        bash <(curl -s https://raw.githubusercontent.com/0xLCT/scripts/master/shell/linux/flatpaks.sh)
    }


    printf "Linux Tools\n\nSelect an option 0-9 \n\n[1] Debian\n[2] Redhat\n[5] Setup ZSH\n[6] Replace mkfs.btrfs with wrapper\n[9] Install flatpaks\n[0] Exit\n "
    read num

    if [ "$num" -ge 0 ] && [ "$num" -le 9 ]; then
    eval "function$num"
    else
        echo "Invalid number. Please enter a number between 0 and 9."
    fi
}
main
