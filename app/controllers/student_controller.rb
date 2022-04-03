
class StudentController < ApplicationController
  load_and_authorize_resource
  def index
    @students= Student.all
  end

  def edit
    @student = Student.find(params[:id])
    @student.update(student_params)
    redirect_to students_path
  end

  def new
    @student = Student.new()
    @departments=Department.all()
    # render json: @teachers
  end
  def show
    @departments = Department.all
    @student = Student.find(params[:id])
    render "new"
  end
  def details
    @student = Student.find(params[:id])
  end
  def create
    @student = Student.new(student_params)

    if @student.save

      redirect_to students_path, notice: "Saved"
    else

      redirect_to students_path, notice: "error"
    end
  end
  def destroy
    @student=Student.find(params[:id])
    if@student.destroy
      redirect_to students_path, notice: 'Deleted!'
    else
      redirect_to students_path, notice: 'error'
    end
  end


  def courselist
    @courses = Course.all
    @departments = Department.all
    @teachers = Teacher.all
    @students =Student.all

  end

  def enroll
    flag=false
    @course = Course.find(params[:id])
    course2 = @course
    if (!StudentEnrollment.has_taken?(course2))
      current_user.courses << @course
      redirect_to course_list_path
    else
      redirect_to course_list_path
    end
    end

  def student_params
    params.require(:student).permit(:name, :email, :phone, :department_id, :password)
  end
  def course_params
    params.require(:course).permit(:course_code, :course_title, :teacher_id, :department_id, :semester, :course_credit)
  end

end
