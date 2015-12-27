#!/bin/bash

#current_path=$(dirname $0)
#
#cd ${current_path}
#
#current_path=$(pwd)
#
#echo "当前shell所在的文件路径：$current_path"
#
#txt_dir="$current_path"/Daily-Commit.txt
#
#echo "当前Daily-Commit.txt所在的文件路径：$txt_dir"
#
#echo "commit" >> $txt_dir
#
#cd $current_path

#使用正则过滤年月日判断正确
#read -p "请输入起始日期（例如20160927）：" start_date
#
#echo "您输入的其实日期为 $start_date"
#
#read -p "请输入截止日期（例如20160927）：" end_date
#
#echo "请输入的截止日期为 $end_date"

cm_echoWithHighlightedColor() {
    echo -e "\033[31m $1 \033[0m"
}

cm_gdateInstalledCheck() {
    gdate_dir=`which gdate`    
    if [ -f "$gdate_dir" ]; then
        echo "gdate is installed，you can use the 'gdate' command now"

    else

        brew_dir=`which brew`   

        if [ -f "$brew_dir" ]; then
            echo "homebrew is installed , but the coreutils is not installed, trying to install coreutils..."
            brew install coreutils || exit 1   

            echo "Commands also provided by macOS have been installed with the prefix "g".If you need to use these commands with their normal names, youcan add a "gnubin" directory to your PATH from your bashrc like:"  
            path_dir="PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH""
            cm_echoWithHighlightedColoe $path_dir

            exit 1
        else

            echo "homebrew is not installed ,trying to install homebrew"
            /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

        fi

    fi


 
}


