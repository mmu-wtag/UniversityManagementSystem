class Student < User
  has_many :taken_courses
  has_many :courses, through: :taken_courses
  belongs_to :department
  has_many :access_tokens,
           class_name: 'Doorkeeper::AccessToken',
           foreign_key: :resource_owner_id,
           dependent: :delete_all

end
