class Patient < ActiveRecord::Base
    belongs_to :dentist 
    def new_patient(patient)
        Patient.create(patient)
    end
end