#!/bin/bash
echo "commit" >> /Users/zhijieios/CMProject/Daily-Commit/Daily-Commit.txt
cd /Users/zhijieios/CMProject/Daily-Commit
git add .
git commit -m "no commit message"
git push origin master

