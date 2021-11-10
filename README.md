# Problem: 
 - Kin has just recently purchased an ingenious machine to assist in reading policy report documents. The machine scans the paper documents for policy numbers, and produces a file with a number of entries with each look like this: 
    _  _     _  _  _  _  _ 
  | _| _||_||_ |_   ||_||_|
  ||_  _|  | _||_|  ||_| _|

  - Each entry is 4 lines long, and each line has 27 characters. The first 3 lines of each entry contain a policy number written using pipes (|) and underscores (_), and the fourth line is blank. Each policy should have 9 digits, all of which should be in the range of 0 - 9. A normal file contains around 500 entries.

  - Your first task is to write a program that can take this file and parse it into actual numbers. 

- The "file" is just a bunch of pipes, spaces, and underscores
- The "file" is the sample.txt in the boilerplate github

1 - Has 27 characters, made up of pipes, spaces, and underscores to help create the policy number.
2 - Has 27 characters, made up of pipes, spaces, and underscores to help create the policy number.
3 - Has 27 characters, made up of pipes, spaces, and underscores to help create the policy number.
4 - Is Blank (Or made up of 27 (spaces) characters)


# Examples:
    _  _     _  _  _  _  _     -> sss s_s s_s sss s_s s_s s_s s_s s_s 
  | _| _||_||_ |_   ||_||_|    -> ss| s_| s_| |_| |_s |_s ss| |_| |_|   
  ||_  _|  | _||_|  ||_| _|    -> ss| |_s s_| ss| s_| |_| ss| |_| s_| 
                               -> sss sss sss sss sss sss sss sss sss 

Take the policy number, break it up into 3 x 3 grids, read and return the number from each specific grid 


# Data Structure:
- Input: A File
    - Which needs to be opened 
    - Needs to be read
    - Need to go through the data to write out an entry (1 policy (made up of 9 numbers), 4 lines long = 27 characters each (first 3 lines has the policy number (s,|_), 4th line is a blank line (all s))
    - Need to loop through the entry & read it, make it into an actual number
- Output: A Policy Number (int)

- Hash? 
    digits = {
    's_s|s||_|sss' => '0',
    'sssss|ss|sss' => '1',
    's_ss_||_ssss' => '2',
    's_ss_|s_|sss' => '3',
    'sss|_|ss|sss' => '4',
    's_s|_ss_|sss' => '5',
    's_s|_s|_|sss' => '6',
    's_sss|ss|sss' => '7',
    's_s|_||_|sss' => '8',
    's_s|_|s_|sss' => '9'
  }

    digits = {
    ' _ | ||_|   ' => '0',
    '     |  |   ' => '1',
    ' _  _||_    ' => '2',
    ' _  _| _|   ' => '3',
    '   |_|  |   ' => '4',
    ' _ |_  _|   ' => '5',
    ' _ |_ |_|   ' => '6',
    ' _   |  |   ' => '7',
    ' _ |_||_|   ' => '8',
    ' _ |_| _|   ' => '9'
  }

# Algorithm:
- Open the File
- Read the File
- Create a hash of "digits" based off the 4 rows from the entry (using underscores, spaces, and pipes)
- Initialize the "text" using a method
- Converting the rows to numbers
  - Split the text by the \n into 4
  - 
# Code:
