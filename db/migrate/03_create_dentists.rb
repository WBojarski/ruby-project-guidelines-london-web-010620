class CreateDentists < ActiveRecord::Migration
    def change
      create_table :dentists do |t|
        t.string :name
      end
    end
  end