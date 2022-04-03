class AddSemesterToCourse < ActiveRecord::Migration[7.0]
  def change
    add_column :courses, :semester, :string
  end
end
