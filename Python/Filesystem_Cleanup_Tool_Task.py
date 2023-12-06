#!/usr/bin/env python



'''script cleans up a directory by removing empty subdirectories and files older than a certain date'''


import os 
import datetime 
  
def remove_empty_folders(root_dir): 
    for root, dirs, files in os.walk(root_dir, topdown=False): 
        for directory in dirs: 
            folder_path = os.path.join(root, directory) 
            try: 
                os.rmdir(folder_path) 
                print(f"Удален пустой каталог: {folder_path}") 
            except OSError as e: 
                print(f"Ошибка при удалении каталога {folder_path}: {e}") 
 
def remove_files_older_than(root_dir, threshold_date): 
    for root, dirs, files in os.walk(root_dir): 
        for file in files: 
            file_path = os.path.join(root, file) 
            try: 
                file_modified_time = os.path.getmtime(file_path) 
                modified_date = datetime.datetime.fromtimestamp(file_modified_time) 
                if modified_date < threshold_date: 
                    os.remove(file_path) 
                    print(f"Удален файл {file_path}, последнее изменение было {modified_date}") 
            except PermissionError as e: 
                print(f"Ошибка доступа к файлу {file_path}: {e}") 
            except Exception as e: 
                print(f"Ошибка при удалении файла {file_path}: {e}") 
 
# Указываем корневой каталог и пороговую дату 
root_directory = 'home/ivan11/git/git-study/HW/2' 
threshold_date = datetime.datetime(2023, 11, 11) 
 
remove_empty_folders(root_directory) 
remove_files_older_than(root_directory, threshold_date)