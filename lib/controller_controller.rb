require"pry"
def register_login
    puts CLIColorize.safe_colorize("If you wish to create an account, please enter 1", :yellow)
    puts CLIColorize.safe_colorize("If you wish to login, please enter 2", :yellow)
    user_input = gets.chomp
    if user_input == "1"
        register
        appointment_options
    elsif user_input == "2"
        find_patient_id
    elsif user_input != (0..2).to_s
        puts CLIColorize.safe_colorize("Invalid input try again", :red)
        register_login
    end
end

def register
    user = {}
    user[:name] = enter_name
    user[:birthdate] = enter_birthdate
    user[:email] = enter_email
    new_patient = Patient.create(user)
    puts CLIColorize.safe_colorize("You have created an account with the id number #{new_patient.id}", :green)
end


def end_screen
    puts CLIColorize.safe_colorize("Anything else we can help you with? y/n", :yellow)
    input = gets.chomp
    

    while input == "n" || "no" 
    case input
        when (1..1000)
            puts CLIColorize.safe_colorize("Wrong input", :red)
        when "yes"
            appointment_options
        when "y"
            appointment_options
        else
            exit
        end
    end
   
end
   
def cls
    system("cls")
  end
