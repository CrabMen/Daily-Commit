#!/bin/bash

current_dir=`pwd`
echo "当前shell所在的文件路径：$current_dir"

txt_dir="$current_dir"/Daily-Commit.txt

echo "当前Daily-Commit.txt所在的文件路径：$txt_dir"

echo "commit" >> $txt_dir

cd $current_dir

git add .

git commit -m "no commit message"

git push origin master


