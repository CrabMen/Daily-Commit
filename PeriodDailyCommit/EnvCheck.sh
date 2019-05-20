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

# cm_gdateInstalledCheck() {
    gdate_dir=`which gdate`
    echo "当前gdate的安装路径：$gdate_dir"
    
    
    
    
    
    gdate_dir_all_files=`ls -al $gdate_dir`
    echo "当前gdate的安装路径下的所有文件：$gdate_dir_all_files"


# }