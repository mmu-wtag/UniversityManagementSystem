class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :type
      t.string :name
      t.string :email
      t.string :password
      t.string :phone
      t.references :department
      t.timestamps
    end
  end
end
