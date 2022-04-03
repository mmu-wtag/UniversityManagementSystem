#require 'doorkeeper/grape/helpers'

module V1
  class Teachers < Grape::API

    # helpers Doorkeeper::Grape::Helpers
    # before do
    #   doorkeeper_authorize!
    # end
    version 'v1', using: :path
    format :json
    prefix :api

    resource :teachers do
      desc 'Return list of Teachers'
      get do
        teachers = Teacher.all
        present teachers
      end
      desc 'Return a specific teacher'
      route_param :id do
        get do
          teacher = Teacher.find(params[:id])
          present teacher
        end
      end
      desc 'Create a new Teacher'
      params do
        requires :name, type: String
        requires :email, type: String
        requires :password, type: String
        requires :phone, type: String
        requires :department_id, type: Integer
      end
      post do
        Teacher.create!({name:params[:name],email:params[:email],password:params[:password],phone:params[:phone],department_id:params[:department_id]})
      end
      desc 'Delete a specific Teacher'
      route_param :id do
        delete do
          teacher=Teacher.find(params[:id])
          teacher.destroy
        end
      end
      desc 'Update a specific teacher'
      route_param :id do
        put do
          Teacher.find(params[:id]).update({ phone:params[:phone] })
        end
      end
    end
  end
end