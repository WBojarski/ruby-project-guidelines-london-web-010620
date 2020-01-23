def find_patient_id
    puts "enter your name!"
    name_input = gets.chomp
    # $current_id = Patient.find_by(name: name_input).id

    if Patient.find_by(name: name_input)
        $current_id = Patient.find_by(name: name_input).id
        puts "Hi, #{name_input} Your patient id is: #{$current_id}"
    else 
        puts "Name not found please select option 1 to register"
        register_login
    end
end

def appointment_options
    puts "1. View appointment"
    puts "2. Change appointment"
    puts "3. Delete appointment"
    puts "4. Make appointment"
    puts "5. Exit"
    user_input = gets.chomp
    if user_input == "1"
        appointments
    elsif user_input == "2"
        update_appointment
        
    elsif user_input == "3"
        delete_appointment
        
    elsif user_input == "4"
        create_appointment
        
    elsif user_input == "5"
        puts "Goodbye"
        exit
    end
end
def appts_for_current_user(id_n)
    Appointment.where(patient_id: id_n).select {|appt| appt}
end

def appointments 
    view = appts_for_current_user($current_id).map {|appt| "#{appt.appt_date} with #{appt.dentist.name}"}
    view.each_with_index do |appt, i|
        puts "#{i + 1}. #{appt}"
    end
end

def view_appointment
    puts "Select your appointment"
    appointments
end

def create_appointment
    app_new = Appointment.create(appt_date: Faker::Date.forward(days:5), duration: Faker::Number.between(from: 10, to: 60), patient_id: $current_id, dentist_id: Dentist.all.map{|dentist| dentist.id}.sample )
    puts "You have created a new appointment on #{app_new.appt_date} " 
end

def delete_appointment
    view_appointment
    puts "Select appointment by number:"
    input = gets.chomp
    array = appts_for_current_user($current_id)
    array[input.to_i - 1].destroy
    puts "You have cancelled your appointment."
    puts "Your appointments now are:"
    appointments
end

def update_appointment
    view_appointment
    puts "Select appointment by number:"
    input = gets.chomp
    array = appts_for_current_user($current_id)
    updated_appt = array[input.to_i - 1].update(appt_date: Faker::Date.forward(days:10), duration: Faker::Number.between(from: 10, to: 60), patient_id: $current_id, dentist_id: Dentist.all.map{|dentist| dentist.id}.sample)
    # appt.update(appt_date: Faker::Date.forward(days:10), duration: Faker::Number.between(from: 10, to: 60), patient_id: $current_id, dentist_id: Dentist.all.map{|dentist| dentist.id}.sample)
    puts "You have changed your appointment"
    puts "Your appointments now are:"
    appointments
end