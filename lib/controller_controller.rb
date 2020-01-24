require"pry"
def register_login
    prompt = TTY::Prompt.new
    menu_options = ["Login","Register as a new patient"]
    menu =  prompt.select("How can we help you today",menu_options, filter: true)

    if menu == "Login"
        find_patient_id
    elsif menu == "Register as a new patient"
        register
        appointment_options
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
    prompt = TTY::Prompt.new
    # puts CLIColorize.safe_colorize("Anything else we can help you with? y/n", :yellow)
    # input = gets.chomp
    menu_options = ["yes","no"]
    menu =  prompt.select("Anything else we can help you with?",menu_options, filter: true)

    if menu == "yes"
        appointment_options
    elsif menu == "no"
        exit
    end 
  
end
   

