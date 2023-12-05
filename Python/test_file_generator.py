#!/usr/bin/env python


'''Create a script that writes a line to a file a specified number of times.
Requirements:

    Scripts read following input args:
        file name
        phrase
        number of repetion phrase'''

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
    