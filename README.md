# Problem: 
 - Kin has just recently purchased an ingenious machine to assist in reading policy report documents. The machine scans the paper documents for policy numbers, and produces a file with a number of entries with each look like this: 
 ```
    _  _     _  _  _  _  _ 
  | _| _||_||_ |_   ||_||_|
  ||_  _|  | _||_|  ||_| _|

```
  - Each entry is 4 lines long, and each line has 27 characters. The first 3 lines of each entry contain a policy number written using pipes (|) and underscores (_), and the fourth line is blank. Each policy should have 9 digits, all of which should be in the range of 0 - 9. A normal file contains around 500 entries.

  - Your first task is to write a program that can take this file and parse it into actual numbers. 

- The "file" is just a bunch of pipes, spaces, and underscores
- The "file" is the sample.txt in the boilerplate github

1 - Has 27 characters, made up of pipes, spaces, and underscores to help create the policy number.
2 - Has 27 characters, made up of pipes, spaces, and underscores to help create the policy number.
3 - Has 27 characters, made up of pipes, spaces, and underscores to help create the policy number.
4 - Is Blank (Or made up of 27 (spaces) characters)


# Examples:
```
    _  _     _  _  _  _  _    
  | _| _||_||_ |_   ||_||_|      
  ||_  _|  | _||_|  ||_| _|   
                              
```
```
1 -> sss s_s s_s sss s_s s_s s_s s_s s_s
2 -> ss| s_| s_| |_| |_s |_s ss| |_| |_|
3 -> ss| |_s s_| ss| s_| |_| ss| |_| s_|
4 -> sss sss sss sss sss sss sss sss sss
```

Take the policy number, break it up into 3 x 3 grids, read and return the number from each specific grid 


# Data Structure:
- Input: A File
    - Which needs to be opened, Google "How to open a file Ruby" [How To Read & Write Files in Ruby](https://www.rubyguides.com/2015/05/working-with-files-ruby/)
    - Needs to be read, see above Google
    - Need to go through the data to write out an entry (1 policy (made up of 9 numbers), 4 lines long = 27 characters each (first 3 lines has the policy number (s,|_), 4th line is a blank line (all s))
    - Need to loop through the entry & read it, make it into an actual number
- Output: A Policy Number (int)

- Hash? 
```
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
```
```
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
``` 
- Need to write a rspec, Google "How to write rspec ruby" [The Definitive RSpec Tutorial With Examples](https://www.rubyguides.com/2018/07/rspec-tutorial/) and [Getting Started with RSpec](https://semaphoreci.com/community/tutorials/getting-started-with-rspec)
  - describe method_name do 
        context "given 'sample'" do <- (needed to pass in the sample text)
            it "describe what the method does" do
                Need an array to check the answers from the sample text
                expect (NameOfModule.name_of_method('path to sample text')).to eq(array_from_above)
            end
    end

  - To test rspec: bundle exec rspec
# Algorithm:
- Create a hash of "digits" based off the 4 rows from the entry (using underscores, spaces, and pipes)
- Create a method that takes in a file 
    - Open the File
    - Read the File
    - Split the text into 4 lines 
    - Map these lines by line
    - Scan the line and seperate it by 3 characters  Google "Split a string by 3 characters in ruby" [Ruby regex for a split every four characters not working](https://stackoverflow.com/questions/1628673/ruby-regex-for-a-split-every-four-characters-not-working/1628694)
    - Make a grid (by transposing) Google "3 by 3 grid ruby" [Turn Rows Into Columns With The Ruby Transpose Method](https://www.rubyguides.com/2017/10/ruby-transpose-method/)
    - Map the grid into numbers to match with the digits hash
    - Join them all together
    - Take the string_of_integers and break them up into 9 characters 
    - Map these into integers 

# Code:
module PolicyOcr

    # - Create a hash of "digits" based off the 4 rows from the entry (using underscores, spaces, and pipes)
    DIGITS = {
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

    # - Create a method that takes in a File 
    def self.make_a_policy_number(file_with_policies)
        # - Open the File 
        file = File.open(file_with_policies)
        # - Read the File 
        file_data = file.readlines.map(&:chomp)
        #   - Split the text into 4 lines 
        split_text = file_data.each_slice(4)
        #   - Map these lines by line 
        string_of_integers = split_text.map{ |lines| lines 
            #   - Scan the line and separate it by 3 characters 
            .map{ |line| line.scan(/.{1,3}/) }
            #   - Make a grid (by transposing) 
            .transpose
            #   - Map the grid into numbers to match with the digits hash 
            .map{ |number| DIGITS[number.join] } }
                #   - Join them all together 
            .join
        
        # - Take the string_of_integers and break them up into 9 characters 
        string_of_integers.scan(/.{1,9}/)
        # - Map these into integers 
        .map{ |policy| policy.to_i } 
    end
   
end