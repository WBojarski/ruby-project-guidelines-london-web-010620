require'pry'
def register_login
    user = {}
    puts "If you wish to create an account, please enter 1"
    puts "If you wish to login, please enter 2"
    user_input = gets.chomp
    if user_input == "1"
        user[:name] = enter_name
        user[:birthdate] = enter_birthdate
        user[:email] = enter_email
        new_patient = Patient.create(user)
        puts "You have created an account with the id number #{new_patient.id} "
    elsif user_input == "2"
        find_patient_id
    
    end
end