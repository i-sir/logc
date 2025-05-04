#!/bin/bash

while true; do
    # 删除文件的函数
    clear_directory() {
        directory_to_clear="/www/wwwroot/log-c/git_log"
        # 删除文件夹中的所有文件
        if [ -d "$directory_to_clear" ]; then
            rm -f "$directory_to_clear"/*
            echo "All files in '$directory_to_clear' have been deleted."
        else
            echo "Directory '$directory_to_clear' does not exist."
        fi
    }

    # 创建文件夹和文件的函数
    create_folder_and_file() {
        # 获取当前时间（年月日时分秒）
        current_time=$(date +"%Y%m%d%H%M%S")
        folder_to_create="/www/wwwroot/log-c/git_log"
        file_to_create="$folder_to_create/$current_time.txt"
        # 创建文件夹并写入内容
        mkdir -p "$folder_to_create"
        echo "$current_time" > "$file_to_create"
        echo "Folder '$folder_to_create' and file '$file_to_create' have been created."
    }

    # Git 提交的函数
    git_commit() {
        # 指定 Git 仓库路径和主分支名称
        git_repo_path="/www/wwwroot/log-c"
        main_branch="master"
        # 切换到 Git 仓库目录
        cd "$git_repo_path" || exit
        # 提交到 Git 仓库
        git add --all
        commit_message=$(date +"%Y%m%d%H%M%S")
        git commit -m "更新----[log----cc----]----;$commit_message"
        git push -f origin "$main_branch"
        echo "Changes pushed to Git."
    }

    # 执行删除文件操作
    clear_directory

    # 执行创建文件夹和文件操作
    create_folder_and_file

    # 执行 Git 提交操作
    git_commit

    #更改为1-2个小时
    sleep $((60 + RANDOM % 61))m
done
