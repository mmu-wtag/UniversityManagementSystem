require 'doorkeeper/grape/helpers'
class Base < Grape::API


  helpers Doorkeeper::Grape::Helpers
  before do
    doorkeeper_authorize!
  end

  mount V1::Courses
  mount V1::Departments
   mount V1::Teachers
  mount V1::Students
end