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



#导入头文件
. ./EnvCheck.sh

#环境检查
cm_gdateInstalledCheck

input_params_array=()
#提示用户输入相关参数
cm_readAction(){

    #使用正则过滤年月日判断正确
    read -p "请输入起始日期（例如20160927）：" start_date

    read -p "请输入截止日期（例如20160927）：" end_date

    read -p "请输入最大随机数：" commit_count

    echo -e "\n\n**********\n输入的起始日期：$start_date\n输入的截止日期：$end_date\n输入的最大随机数：$commit_count\n**********\n\n"

    start_date_en=$(env LANG=en_US.UTF-8 gdate -d "$start_date")

    end_date_en=$(env LANG=en_US.UTF-8 gdate -d "$end_date")

    # input_params_array[0]=$start_date_en

    # input_params_array[1]=$end_date_en

    # input_params_array[1]=$commit_count

    # echo $input_params_array

    cm_validateDate
   
}

#生成随机字符串
cm_randomInteger() {
    min=0
    max=$commit_count
    random_integer=$((min + RANDOM % $((max-min))))
    echo $random_integer
}

cm_validateDate(){

    if [[ -z "$start_date_en" || -z "$end_date_en" ]]; then
         cm_echoWithHighlightedColor "\n请输入的日期不合法，请重新输入\n"

         cm_readAction

         exit 1
    fi

    git_action

}

git_action() {



    current_path=$(dirname $0)

    cd ${current_path}

    current_path=$(pwd)

    echo "当前shell所在的文件路径：$current_path"

    txt_dir="$current_path"/Daily-Commit.txt

    echo "当前Daily-Commit.txt所在的文件路径：$txt_dir"

    start_date_timestamp=$(gdate -d $start_date +%s)
    end_date_timestamp=$(gdate -d $end_date +%s)
    start_date_timestamp_count=$(expr $start_date_timestamp)
    end_date_timestamp_count=$(expr $end_date_timestamp)

        # for((i=0;i<$random_commit_count;i++)); do

        #     echo "$(env LANG=en_US.UTF-8 gdate -d @$start_date_timestamp_count)：commit$i"

        #     start_date_timestamp_count += 86400
        # done

    echo "\n$start_date_timestamp_count\n$end_date_timestamp_count"

    while [ $start_date_timestamp_count -le $end_date_timestamp_count ]; do
        #   git add .
        #   git commit -m "merge"

          git pull

          sleep 8s

          random_commit_count=$(cm_randomInteger)

          for((i=0;i<$random_commit_count;i++)); do
            
            echo "$(env LANG=en_US.UTF-8 gdate -d @$(expr $start_date_timestamp_count + 86400 / $random_commit_count))：commit$i" >> $txt_dir
            git_date=$(env LANG=en_US.UTF-8 gdate -d @$(expr $start_date_timestamp_count + 86400 / $random_commit_count))
            git add .
            git commit --amend --date="$git_date" -m "$(env LANG=en_US.UTF-8 gdate -d @$(expr $start_date_timestamp_count + 86400 / $random_commit_count))：commit$i"

          done

          start_date_timestamp_count=$(expr $start_date_timestamp_count + 86400)
          git pull 
          sleep 8s
          git push origin master 
          sleep 8s
        #   start_date_timestamp="$start_date_timestamp"
          
    done
    


}

cm_readAction
# cm_validateDate





# date_en=$(env LANG=en_US.UTF-8 gdate -d "20180403")
# echo "当前的英文日期为：$date_en"
