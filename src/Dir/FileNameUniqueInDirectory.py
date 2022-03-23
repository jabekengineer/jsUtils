import os
import argparse

def Main() -> bool:
    # List all files in a directory using scandir()
    if(Args.FileName is not None and Args.DirName is not None):
        testPath = os.path.join(Args.DirName, Args.FileName)
        try: 
            if os.path.exists(testPath):
                output = False
            else:
                output = True
        except IOError:
            print("Please Reformat DirName or FileName")  
        # if ListFiles option is selected, print the files out
        if(Args.ListFiles):
            with os.scandir(Args.DirName) as entries: #iterate through directory name
                for entry in entries:
                    print(entry.name, os.linesep)
    return output
if __name__ == "__main__":
    Parser = argparse.ArgumentParser(description="Check that file name is unique in Directory")
    Parser.add_argument("-FileName", 
                        help="File name with extension",
                        dest="FileName",
                        type=str,
                        required=True)
    Parser.add_argument("-DirName",
                        help="Directory you want to check", 
                        dest="DirName",
                        type=str,
                        required=True)
    Parser.add_argument("-ListFiles", 
                        help="List files in specified directory", 
                        dest="ListFiles",
                        type=bool, 
                        required=False)

    Args = Parser.parse_args()
    flag = Main()
    print(flag)