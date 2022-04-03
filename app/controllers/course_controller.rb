class CourseController < ApplicationController
  load_and_authorize_resource
  def index
    @courses = Course.all
  end

  def edit
    @course = Course.find(params[:id])
    @course.update(course_params)
    redirect_to root_path
  end

  def new
    @teachers = Teacher.all
    @departments= Department.all
    @course =Course.new()
    # render json: @teachers
  end
  def show
    @course =Course.find(params[:id])
    @teachers = Teacher.all
    @departments=Department.all
    render "new"
  end

  def create
    @course=Course.new(course_params)

     if @course.department==@course.teacher.department
       @course.save
       redirect_to root_path, notice: "Saved"
     else
       redirect_to root_path , notice: "error"
     end
    end
  def destroy
    @course=Course.find(params[:id])
    if@course.destroy
      redirect_to root_path, notice: 'Deleted!'
    else
      redirect_to root_path, notice: 'error'
    end
  end
  def details
    @course = Course.find(params[:id])
    end

  def course_params
    params.require(:course).permit(:course_code, :course_title, :teacher_id, :department_id, :semester, :course_credit)
  end
  end
