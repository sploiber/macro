class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.string :last_name
      t.string :first_name
      t.string :address

      t.timestamps
    end
  end
end
