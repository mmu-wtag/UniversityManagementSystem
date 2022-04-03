class CreateTakenCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :taken_courses do |t|
      t.float :gpa
      t.references :course
      t.references :student
      t.timestamps
    end
  end
end
