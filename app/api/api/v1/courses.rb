require 'doorkeeper/grape/helpers'

module V1
  class Courses < Grape::API


    # helpers Doorkeeper::Grape::Helpers
    # before do
    #   doorkeeper_authorize!
    # end


    version 'v1', using: :path
    format :json
    prefix :api

    resource :courses do
      desc 'Return list of Courses'
      get do
        courses = Course.all
        present courses
      end
      desc 'Return a specific course'
      route_param :id do
      get do
        course = Course.find(params[:id])
        present course
      end
      end
      desc 'Create a new Course'
      params do
        requires :course_code, type: String
        requires :course_title, type: String
        requires :department_id, type: Integer
        requires :teacher_id, type: Integer
        requires :semester, type: String
        requires :course_credit, type: Float

      end
      post do
        Course.create!({course_code:params[:course_code], course_title:params[:course_title],department_id:params[:department_id],teacher_id:params[:teacher_id],semester:params[:semester],course_credit:params[:course_credit]})
      end
      desc 'Delete a specific song'
      route_param :id do
        delete do
          course=Course.find(params[:id])
          course.destroy
        end
      end
      desc 'Update a specific course'
      route_param :id do
        put do
          Course.find(params[:id]).update({ semester:params[:semester] })
        end
      end
    end
  end
end