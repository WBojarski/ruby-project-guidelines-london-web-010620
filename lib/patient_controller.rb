require"pry"
    def enter_name
        puts CLIColorize.safe_colorize("enter your name! ", :yellow)
        name_input = gets.chomp
        name_input
    end
    
    def enter_birthdate
        puts CLIColorize.safe_colorize("enter your birthdate! ", :yellow)
        dob_input = gets.chomp
        dob_input
    end
    
    def enter_email
        puts CLIColorize.safe_colorize("enter your email! ", :yellow)
        email_input = gets.chomp
        email_input
    end


