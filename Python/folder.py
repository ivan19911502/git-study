#!/usr/bin/env python

'''Script that organizes files in a directory into subdirectories based on file type.
Scan a specified directory.
Create a new directory for each unique file extension.
Move each file into the corresponding directory based on its file extension.'''

import os 
import shutil 
 
def organize_files(directory): 
    if not os.path.exists(directory): 
        print(f"Указанный каталог '{directory}' не существует.") 
        return 
 
    for filename in os.listdir(directory): 
        file_path = os.path.join(directory, filename) 
        if os.path.isfile(file_path): 
            file_extension = filename.split('.')[-1] 
            if not os.path.exists(os.path.join(directory, file_extension)): 
                os.makedirs(os.path.join(directory, file_extension)) 
            try: 
                shutil.move(file_path, os.path.join(directory, file_extension, filename)) 
                print(f"Файл '{filename}' перемещен в каталог '{file_extension}'.") 
            except shutil.Error as e: 
                print(f"Не удалось переместить файл '{filename}': {e}") 
            except Exception as e: 
                print(f"Произошла ошибка при обработке файла '{filename}': {e}") 
 

directory_path = '/home/ivan11/git/git-study/HW/folder' 
organize_files(directory_path) 
