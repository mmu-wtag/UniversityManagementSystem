#require 'doorkeeper/grape/helpers'
module V1
  class Students < Grape::API
    # helpers Doorkeeper::Grape::Helpers
    # before do
    #   doorkeeper_authorize!
    # end
    # get :me, scopes: [:students, :read] do
    #   current_user.to_json
    # end

    version 'v1', using: :path
    format :json
    prefix :api

    resource :students do
      desc 'Return list of Students'
      get do
        students = Student.all
        present students
      end
      desc 'Return a specific student'
      route_param :id do
        get do
          student = Student.find(params[:id])
          present student
        end
      end
      desc 'Create a new Student'
      params do
        requires :name, type: String
        requires :email, type: String
        requires :password, type: String
        requires :phone, type: String
        requires :department_id, type: Integer
      end
      post do
        Student.create!({name:params[:name],email:params[:email],password:params[:password],phone:params[:phone],department_id:params[:department_id]})
      end
      desc 'Delete a specific Student'
      route_param :id do
        delete do
          student=Student.find(params[:id])
          student.destroy
        end
      end
      desc 'Update a specific student'
      route_param :id do
        put do
          Student.find(params[:id]).update({ phone:params[:phone] })
        end
      end
    end
  end
end