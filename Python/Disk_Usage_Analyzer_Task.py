#!/usr/bin/env python

'''Sscript that reports the disk usage of each subdirectory within a given directory.
Traverse the specified directory and all subdirectories.
Calculate the total size for each subdirectory.
Identify and list the largest files.'''

import os 
 
def get_directory_size(path): 
    total_size = 0 
    for dirpath, dirnames, filenames in os.walk(path): 
        for filename in filenames: 
            filepath = os.path.join(dirpath, filename) 
            total_size += os.path.getsize(filepath) 
    return total_size 
 
def get_largest_files(path, n=5): 
    files_info = [] 
    for dirpath, dirnames, filenames in os.walk(path): 
        for filename in filenames: 
            filepath = os.path.join(dirpath, filename) 
            files_info.append((filepath, os.path.getsize(filepath))) 
    files_info.sort(key=lambda x: x[1], reverse=True) 
    return files_info[:n] 
 
def main(): 
    root_directory = '/home/ivan11/git/git-study/HW/333' 
 
    for dirpath, dirnames, filenames in os.walk(root_directory): 
        print(f"Directory: {dirpath}") 
        total_size = get_directory_size(dirpath) 
        print(f"Total size: {total_size} bytes") 
        largest_files = get_largest_files(dirpath) 
        print("Largest files:") 
        for file, size in largest_files: 
            print(f"{file} - {size} bytes") 
        print("\n") 
 
if __name__ == "__main__": 
    main() 
