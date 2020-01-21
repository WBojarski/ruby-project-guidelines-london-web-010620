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
        binding.pry
    elsif user_input == "2"
        appointment_controller
    end
end