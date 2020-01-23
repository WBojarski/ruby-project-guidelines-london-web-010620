require_relative '../config/environment'

def welcome_message
    
    puts "Welcome to GHW Dental Practice\n\n"
    puts "-------------------------------------------"
    puts "Please select one of the following options."
    puts "-------------------------------------------\n\n"
end

def run
    welcome_message
    #welcome message
    register_login
    #promts user with option 1(new) or 2(login)
    appointment_options
    end_screen
end
run
