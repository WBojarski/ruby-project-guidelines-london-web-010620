class CreatePatients < ActiveRecord::Migration[5.2]
    def change
      create_table :patients do |t|
        t.string :name
        t.date :birthdate
        t.string :email
      end
    end
end