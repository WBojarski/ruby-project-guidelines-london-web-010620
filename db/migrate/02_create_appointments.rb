class CreateAppointments< ActiveRecord::Migration[5.2]
    def change
      create_table :appointments do |t|
        t.datetime :appt_date
        t.integer :duration
        t.integer :patient_id
        t.integer :dentist_id
      end
    end
  end

