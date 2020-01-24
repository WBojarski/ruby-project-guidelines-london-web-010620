def find_patient_id
    puts CLIColorize.safe_colorize("enter your name!", :yellow)
    name_input = gets.chomp

    if Patient.find_by(name: name_input)
        $current_id = Patient.find_by(name: name_input).id
        puts CLIColorize.safe_colorize("Hi, #{name_input} Your patient id is: #{$current_id}", :green)
        appointment_options
    else 
        puts CLIColorize.safe_colorize("Name not found please select option 1 to register", :red)
        register_login
    end
end

def appointment_options
    system "clear"
    
    puts CLIColorize.safe_colorize("----------------------", :blue)
    puts CLIColorize.safe_colorize("Appointment Menu      ",:red)
    puts CLIColorize.safe_colorize("----------------------", :blue)
    puts CLIColorize.safe_colorize("Please select one of the options below:\n\n", :yellow)
        puts CLIColorize.safe_colorize("1. View appointment   ", :yellow)
        puts CLIColorize.safe_colorize("2. Change appointment ", :yellow)
        puts CLIColorize.safe_colorize("3. Delete appointment ", :yellow)
        puts CLIColorize.safe_colorize("4. Make appointment   ", :yellow)
        puts CLIColorize.safe_colorize("5. Exit               ", :yellow)
    user_input = gets.chomp
    system "clear"
    if user_input == "1"
        appointments
        end_screen
    elsif user_input == "2"
        update_appointment
        # end_screen
    elsif user_input == "3"
        delete_appointment   
    elsif user_input == "4"
        create_appointment  
    elsif user_input == "5"
        puts CLIColorize.safe_colorize("Goodbye! ", :green)
        exit
    end
    system "clear"

end
def appts_for_current_user(id_n)
    Appointment.where(patient_id: id_n).select {|appt| appt}
end

def appointments 
    view = appts_for_current_user($current_id).map {|appt| "#{appt.appt_date} with #{appt.dentist.name}"}
    puts CLIColorize.safe_colorize("Your appoinments are:", :yellow)
    view.each_with_index do |appt, i|
        puts CLIColorize.safe_colorize("#{i + 1}. #{appt} ", :green)
    end
end

def view_appointment
    system "clear"
    appointments
    puts CLIColorize.safe_colorize("Select your appointment by number", :yellow)
end

def create_appointment
    system "clear"

    app_new = Appointment.create(appt_date: Faker::Date.forward(days:5), duration: Faker::Number.between(from: 10, to: 60), patient_id: $current_id, dentist_id: Dentist.all.map{|dentist| dentist.id}.sample )
    puts CLIColorize.safe_colorize("You have created a new appointment on #{app_new.appt_date}", :green)
    end_screen
end

def delete_appointment
    system "clear"

    view_appointment
    input = gets.chomp
    system "clear"
    array = appts_for_current_user($current_id)
    array[input.to_i - 1].destroy
    puts CLIColorize.safe_colorize("You have cancelled your appointment. ", :yellow)
    puts CLIColorize.safe_colorize("Your appointments now are: ", :yellow)
    appointments
    end_screen
end

def update_appointment
    system "clear"

    view_appointment
    input = gets.chomp
    system "clear"
    array = appts_for_current_user($current_id)
    updated_appt = array[input.to_i - 1].update(appt_date: Faker::Date.forward(days:10), duration: Faker::Number.between(from: 10, to: 60), patient_id: $current_id, dentist_id: Dentist.all.map{|dentist| dentist.id}.sample)
    puts CLIColorize.safe_colorize("You have changed your appointment", :yellow)
    appointments
    end_screen
    
end