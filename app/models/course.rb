class Course < ApplicationRecord
  belongs_to :department
  belongs_to :teacher
  has_many :taken_courses
  has_many :students, through: :taken_courses
  validates :course_code, presence: true, uniqueness: true
  validates :course_title, presence: true, uniqueness: true
end
