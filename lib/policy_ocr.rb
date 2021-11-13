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
            #   - Scan the line and seperate then by 3 characters 
            .map{ |line| line.scan(/.../) }
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