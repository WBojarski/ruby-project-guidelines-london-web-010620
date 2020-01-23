def find_patient_id
    puts "enter your name!"
    name_input = gets.chomp
    $current_id = Patient.find_by(name: name_input).id
    puts "Hi, #{name_input} Your patient id is: #{$current_id}"
end

def appointment_options
    puts "1 = view appointment"
    puts "2 = change appointment"
    puts "3 = delete appointment"
    puts "4 = make appointment"
    user_input = gets.chomp
    if user_input == "1"
        view_appointment($current_id)
    elsif user_input == "2"
        update_appointment
    elsif user_input == "3"
        delete_appointment
    elsif user_input == "4"
        create_appointment
    end
end

def view_appointment(id_n)
    view = Appointment.all.find_by(patient_id: id_n)
    # view2 = Appointment.all.find_by(patient_id: id_n)
    puts "Your appointment is on: #{view.appt_date}"
    puts "Your dentist is: #{view.dentist.name}"
end

def create_appointment
    app_new = Appointment.create(appt_date: Faker::Date.forward(days:5), duration: Faker::Number.between(from: 10, to: 60), patient_id: $current_id, dentist_id: Dentist.all.map{|dentist| dentist.id}.sample )
    puts "You have created a new appointment on #{app_new.appt_date} "
end

def delete_appointment
    appt = Appointment.all.find_by(patient_id:$current_id).id
    Appointment.destroy(appt)
    puts "You have cancelled your appointment."
end

def update_appointment
    appt = Appointment.all.find_by(patient_id:$current_id)
    appt.update(appt_date: Faker::Date.forward(days:10), duration: Faker::Number.between(from: 10, to: 60), patient_id: $current_id, dentist_id: Dentist.all.map{|dentist| dentist.id}.sample)
    puts "You have changed your appointment to #{appt.appt_date}  "
end