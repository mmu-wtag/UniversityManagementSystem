
class TeacherController < ApplicationController

   load_and_authorize_resource
  def index
    @teachers = Teacher.all
  end
  def edit
    @teacher = Teacher.find(params[:id])
    @teacher.update(teacher_params)
    redirect_to teachers_path
  end

  def new
    @teacher = Teacher.new()
    @departments=Department.all()
    # render json: @teachers
  end
  def show
    @departments = Department.all
    @teacher = Teacher.find(params[:id])
    render "new"
  end
  def details
    @teacher = Teacher.find(params[:id])
  end
  def create
    @teacher = Teacher.new(teacher_params)

    if @teacher.save

      redirect_to teachers_path, notice: "Saved"
    else

        redirect_to teachers_path, notice: "error"
    end
  end
  def destroy
    @teacher=Teacher.find(params[:id])
    if@teacher.destroy
      redirect_to teachers_path, notice: 'Deleted!'
    else
      redirect_to teachers_path, notice: 'error'
    end
  end

  def teacher_params
    params.require(:teacher).permit(:name, :email, :phone, :department_id, :password)
  end

end
