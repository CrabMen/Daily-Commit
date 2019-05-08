#!/bin/bash
echo "commit" >> /Users/zhijieios/CMProject/Daily-Commit/Daily-Commit.txt
cd /Users/zhijieios/CMProject/Daily-Commit
echo "cd /Users/zhijieios/CMProject/Daily-Commit" >> /Users/zhijieios/CMProject/Daily-Commit/Daily-Commit.txt

git add .

git commit -m "no commit message"

git push 


