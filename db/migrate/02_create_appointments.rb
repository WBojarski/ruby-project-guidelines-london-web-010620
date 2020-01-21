class CreateAppointments< ActiveRecord::Migration
    def change
      create_table :appointments do |t|
        t.datetime :appt_date
        t.integer :duration
        t.integer :patient_id
        t.integer :dentist_id
      end
    end
  end

  #Appointment.create(appt_date: Faker::Date.forward(days:90), duration: Faker::Number.between(from: 10, to: 60),