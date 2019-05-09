#!/bin/bash

current_path=$(dirname $0)

cd ${current_path}

current_path=$(pwd)



echo "当前shell所在的文件路径：$current_path"

txt_dir="$current_path"/Daily-Commit.txt

echo "当前Daily-Commit.txt所在的文件路径：$txt_dir"

echo "commit" >> $txt_dir

cd $current_path

git config user.email "tobecrabman@163.com"
git config user.name "CrabMen"


git add .

git commit -m "no commit message"

git push


