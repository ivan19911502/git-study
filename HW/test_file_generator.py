#!/usr/bin/env python




import sys 
 
def gen(file, text, count): 
    with open(file, 'w') as file: 
        for i in range(count): 
            file.write(text + '\n') 

 
if __name__ == "__main__": 
    if len(sys.argv) != 4: 
        print("Error!") 
    else: 
        file = sys.argv[1] 
        text = sys.argv[2] 
        count = int(sys.argv[3]) 
        gen(file, text, count) 
    