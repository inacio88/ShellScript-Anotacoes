#!/bin/bash

echo "Enter the name or pattern of the files to delete:"
read pattern

echo "Matching files:"
found_files=()
while IFS= read -r -d $'\0' file; do
    found_files+=("$file")
    echo "$file"
done < <(find . -name "*$pattern*" -print0)

echo "Enter 'd' to delete a file, 's' to skip, 'a' to delete all, or 'q' to quit:"

while read -n1 choice; do
    echo ""
    case $choice in
        d)
            echo "Enter the number of the file to delete (1-${#found_files[@]}):"
            read index
            if [[ "$index" =~ ^[1-9][0-9]*$ && "$index" -le "${#found_files[@]}" ]]; then
                echo "Are you sure you want to delete ${found_files[$index-1]}? [y/N]"
                read confirm
                if [[ "$confirm" =~ ^[yY]$ ]]; then
                    rm "${found_files[$index-1]}"
                    unset 'found_files[index-1]'
                    echo "Deleted ${found_files[$index-1]}"
                else
                    echo "Skipping ${found_files[$index-1]}"
                fi
            else
                echo "Invalid choice"
            fi
            ;;
        s)
            echo "Skipping file"
            ;;
        a)
            echo "Are you sure you want to delete all files matching '$pattern'? [y/N]"
            read confirm
            if [[ "$confirm" =~ ^[yY]$ ]]; then
                for file in "${found_files[@]}"; do
                    rm "$file"
                    echo "Deleted $file"
                done
                found_files=()
            else
                echo "Skipping all files"
            fi
            ;;
        q)
            echo "Quitting"
            break
            ;;
        *)
            echo "Invalid choice"
            ;;
    esac
    echo "Enter 'd' to delete a file, 's' to skip, 'a' to delete all, or 'q' to quit:"
done

echo "Remaining files:"
for file in "${found_files[@]}"; do
    echo "$file"
done

