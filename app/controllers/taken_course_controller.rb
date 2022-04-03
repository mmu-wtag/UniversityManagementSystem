class TakenCourseController < ApplicationController
  load_and_authorize_resource
  def courselist
    @courses = Course.all
    @departments = Department.all
    @teachers = Teacher.all
    @students =Student.all

  end

  def enroll
    flag=false
    @course = Course.find(params[:id])
    render :json => @course
    course2 = @course
    people=current_user
    if (!StudentEnrollment.has_taken?(course2,people))
      current_user.courses << @course
      redirect_to course_list_path
    else
      redirect_to course_list_path
    end
  end

  def course_params
    params.require(:course).permit(:course_code, :course_title, :teacher_id, :department_id, :semester, :course_credit)
  end
end
