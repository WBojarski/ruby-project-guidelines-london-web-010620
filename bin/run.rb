require_relative '../config/environment'

def welcome_message
    
    puts "Welcome to GHW Dental Practice"
    puts "------------------------------"
    puts "Please select one of the following options."
    puts "------------------------------\n\n"
end

def run
    welcome_message
    #welcome message
    register_login
    #promts user with option 1(new) or 2(login)
    appointment_options

end
run
# welcome
# find_patient_id
# view_appointment(find_patient_id)
    #Direct patient to 2a/b/c/d
    #puts "2. User exists - enter name- LOGIN"

    # puts "  2a User wants to make an Appointment"
    # puts "  2b.User wants to update appointment"
    # puts"   2c. User wants to find appointment info --> view_appointment()"
    # puts "  2.d User wants to cancel appointment"