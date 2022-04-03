class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.references :department
      t.references :teacher
      t.timestamps
    end
  end
end
