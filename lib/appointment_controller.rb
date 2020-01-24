def find_patient_id
    puts CLIColorize.safe_colorize("Enter your name!", :yellow)
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
    prompt = TTY::Prompt.new

    menu_options = ["View appointment", "Change appointment", "Delete appointment", "Make appointment", "Exit"]
    menu = prompt.select("Select one of the options below:",menu_options, filter: true)

    case menu

    when "View appointment"
        appointments
        end_screen
    when "Change appointment"
        update_appointment
    when "Delete appointment"
        delete_appointment
    when "Make appointment"
        create_appointment
    when "Exit"
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
    prompt = TTY::Prompt.new
    
    appt1 = Appointment.new(appt_date: Faker::Time.forward(days: 5, period: :morning, format: :long), duration: 30, patient_id: $current_id, dentist_id: Dentist.all.map{|dentist| dentist.id}.sample )
    appt2 = Appointment.new(appt_date: Faker::Time.forward(days: 10, period: :morning, format: :long), duration: 30, patient_id: $current_id, dentist_id: Dentist.all.map{|dentist| dentist.id}.sample )
    appt3 = Appointment.new(appt_date: Faker::Time.forward(days: 15, period: :afternoon, format: :long), duration: 30, patient_id: $current_id, dentist_id: Dentist.all.map{|dentist| dentist.id}.sample )

    
    view_outputs = [appt1[:appt_date], appt2[:appt_date], appt3[:appt_date]]
    
    menu = prompt.select("Select from one of the appointments below:", view_outputs, filter: true)

    case menu
    when appt1.appt_date
        appt1.save
    when appt2.appt_date
        appt2.save
        
    when appt3.appt_date
        appt3.save
        
    end
    
    puts CLIColorize.safe_colorize("You have created a new appointment on #{menu}", :green)
    end_screen
end

def delete_appointment
    system "clear"

    view_appointment
    input = gets.chomp
    system "clear"
    array = appts_for_current_user($current_id)
    array[input.to_i - 1].destroy
    puts CLIColorize.safe_colorize("*** You have cancelled your appointment. ***", :red)
    # puts CLIColorize.safe_colorize("Your appointments now are: ", :yellow)
    appointments
    end_screen
end


def update_appointment
    system "clear"
    view_appointment #shows current appts
    input = gets.chomp #appt to change
    system "clear"
    array = appts_for_current_user($current_id)
    option1 = Appointment.new(appt_date: Faker::Time.forward(days: 5, period: :morning, format: :long), duration: 30, patient_id: $current_id, dentist_id: Dentist.all.map{|dentist| dentist.id}.sample )
    option2 = Appointment.new(appt_date: Faker::Time.forward(days: 10, period: :morning, format: :long), duration: 30, patient_id: $current_id, dentist_id: Dentist.all.map{|dentist| dentist.id}.sample )
    option3 = Appointment.new(appt_date: Faker::Time.forward(days: 15, period: :afternoon, format: :long), duration: 30, patient_id: $current_id, dentist_id: Dentist.all.map{|dentist| dentist.id}.sample )
    view_outputs = [option1[:appt_date], option2[:appt_date], option3[:appt_date]]
    puts "Select from one of the appointments below:"
    view_outputs.each_with_index do |app,i|
        puts "#{i+1}.#{app} "
    end
    user_input2 = gets.chomp #selected appt
    case user_input2
    when "1"
        option1.save
    when "2"
        option2.save
    when "3"
        option3.save
    end
    array[input.to_i - 1].destroy
    puts CLIColorize.safe_colorize("Appointment successfully updated! These are your current appointments:", :green)
    appointments
    end_screen
end