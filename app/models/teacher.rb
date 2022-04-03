class Teacher < User
  has_many :courses, dependent: :destroy
  belongs_to :department
end
