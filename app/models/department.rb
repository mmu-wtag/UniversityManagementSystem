class Department < ApplicationRecord
  has_one :department_head
  has_many :teachers, dependent: :destroy
  has_many :courses, dependent: :destroy
  has_many :students
  validates :name, presence: true, uniqueness: true
end
