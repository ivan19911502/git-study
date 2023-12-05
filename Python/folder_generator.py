
#!/usr/bin/env python


'''Create a target folder if not exists
function which create 10 folders inside(10 is default value, funcsion should have input argument with folders quantity)
main part which create 10 folders and then 10 folders inside each one'''

import os 
 
def create_target_folder(root_path): 
    if not os.path.exists(root_path): 
        os.makedirs(root_path) 
        print(f"Целевая папка '{root_path}' успешно создана.") 
    else: 
        print(f"Целевая папка '{root_path}' уже существует.") 
 
def generateTenFolders(outer_folder, num_folders=10): 
    for i in range(10): 
        folder_name = f"test0{i}"
        folder_path = os.path.join(outer_folder, folder_name) 
        os.makedirs(folder_path)
        print(f"Папка '{folder_name}' успешно создана внутри '{outer_folder}'.") 
 
def main(): 
    root_path = "tmp" 
    create_target_folder(root_path) 
    generateTenFolders(root_path) 
    for i in range(10): 
        inner_folder = os.path.join(root_path, f"test0{i}") 
        generateTenFolders(inner_folder) 
 
if __name__ == "__main__": 
    main() 




