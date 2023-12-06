#!/usr/bin/env python

'''Program that compares two directories and reports the differences between them.
The program should output the following:

    Unique files in each directory.
    Files that are in both directories but differ.
    A summary report of the findings.'''

import filecmp

# Example directories
dir1 = '/home/ivan11/git/git-study/HW/1'
dir2 = '/home/ivan11/git/git-study/HW/2'

# Create a directory comparison object
comparison = filecmp.dircmp(dir1, dir2)

# Access comparison results
print(f"Common files: {comparison.common}")
print(f"Files only in {dir1}: {comparison.left_only}")
print(f"Files only in {dir2}: {comparison.right_only}")
print(f"Differences between common files: {comparison.diff_files}")

# Optionally, print a comparison report
comparison.report()