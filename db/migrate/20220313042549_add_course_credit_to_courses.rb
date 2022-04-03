class AddCourseCreditToCourses < ActiveRecord::Migration[7.0]
  def change
    add_column :courses, :course_credit, :float
  end
end
