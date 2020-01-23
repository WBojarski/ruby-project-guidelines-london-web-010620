require'pry'
def register_login
    puts "If you wish to create an account, please enter 1"
    puts "If you wish to login, please enter 2"
    user_input = gets.chomp
    if user_input == "1"
        register
        appointment_options
    elsif user_input == "2"
        find_patient_id
    elsif user_input != (0..2).to_s
        puts "Invalid input try again" 
        register_login
    end
end

def register
    user = {}
    user[:name] = enter_name
    user[:birthdate] = enter_birthdate
    user[:email] = enter_email
    new_patient = Patient.create(user)
    puts "You have created an account with the id number #{new_patient.id} "
end


def end_screen
    puts "Anything else we can help you with? y/n"
    input = gets.chomp
    while input == "y" || input == "yes" do
        puts "Anything else we can help you with? y/n"
        appointment_options
    end
    exit
end
