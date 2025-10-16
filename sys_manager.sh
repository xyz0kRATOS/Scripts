#!/bin/bash

add_users() {
    echo "Enter the filename that contains the list of users:"
    read filename

    if [ ! -f "$filename" ]; then
        echo "Error: File not found!"
        return
    fi

    while read -r username; do
        if id "$username" &>/dev/null; then
            echo "User $username already exists."
        else
            sudo useradd "$username"
            echo "User $username created successfully."
        fi
    done < "$filename"
}

setup_projects() {
    echo "Enter the username for project setup:"
    read username

    if ! id "$username" &>/dev/null; then
        echo "User not found!"
        return
    fi

    echo "Enter the number of projects to create:"
    read num

    base_dir="/home/$username/projects"
    mkdir -p "$base_dir"

    for ((i = 1; i <= num; i++)); do
        mkdir -p "$base_dir/project_$i"
        echo "Project_$i created successfully for $username."
    done
}


sys_report() {
    echo "Enter output filename for report:"
    read output

    {
  
        echo "Hostname: $(hostname)"
        echo "Current User: $(whoami)"
        echo "Logged-in Users:"
        who
        echo "Disk Usage:"
        df -h
    } > "$output"

    echo "System report saved to $output"
}

process_manage() {
    echo "Process Management Options:"
    echo "1) Show all running processes"
    echo "2) Show zombie processes"
    echo "3) Kill a process"
    read -p "Choose an option (1-3): " opt

    case $opt in
        1) ps -e ;;
        2) ps aux | awk '{ if ($8 == "Z") print $0 }' ;;
        3)
            read -p "Enter PID to kill: " pid
            kill "$pid" && echo "Process $pid killed." || echo "Failed to kill process."
            ;;
        *) echo "Invalid option." ;;
    esac
}

perm_owner() {
    echo "Enter the username:"
    read username
    echo "Enter file or directory path:"
    read path
    echo "Enter permission (e.g., 755):"
    read perm

    if [ ! -e "$path" ]; then
        echo "Error: Path not found!"
        return
    fi

    sudo chmod "$perm" "$path"
    sudo chown "$username":"$username" "$path"
    echo "Permissions and ownership updated for $path"
}

while true; do
    echo "1) Add Users"
    echo "2) Setup Projects"
    echo "3) System Report"
    echo "4) Process Management"
    echo "5) Permission & Ownership"
    echo "6) Exit"
    read -p "Choose an option: " choice

    case $choice in
        1) add_users ;;
        2) setup_projects ;;
        3) sys_report ;;
        4) process_manage ;;
        5) perm_owner ;;
        6) echo "Exiting..."; break ;;
    esac
done

