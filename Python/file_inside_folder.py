#!/usr/bin/env python


'''Function which create 10 files with target content inside target folder.'''


import os 
 
def createTenFilesInDir(path, phrase="default_text", file_count=0): 
    if not os.path.exists(path): 
        print("The specified directory does not exist.") 
        return 
    if file_count > 10: 
        return 
    file_path = os.path.join(path, f"file{file_count}.txt") 
    with open(file_path, 'w') as file: 
        file.write(phrase) 
    print(f"Created file '{file_path}' with content '{phrase}'") 
    createTenFilesInDir(path, phrase, file_count + 1) 
 
# ipput args 
target_directory = "/home/ivan11/git/git-study/HW/2" 
createTenFilesInDir(target_directory, "Hello, World!") 
