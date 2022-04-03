class DepartmentController < ApplicationController
  load_and_authorize_resource
  def index
    @departments= Department.all
  end

  def edit
    @department = Department.find(params[:id])
    @department.update(department_params)
    redirect_to departments_path
  end

  def new
    @department = Department.new()
    # render json: @teachers
  end
  def show
    @department =Department.find(params[:id])
    render "new"
  end
  def details
    @department = Department.find(params[:id])
  end
  def create
    @department = Department.new(department_params)

    if @department.save
      redirect_to departments_path, notice: "Saved"
    else
      redirect_to departments_path, notice: "error"
    end
  end
  def destroy
    @department=Department.find(params[:id])
    if@department.destroy
      redirect_to departments_path, notice: 'Deleted!'
    else
      redirect_to departments_path, notice: 'error'
    end
  end

  def department_params
    params.require(:department).permit(:name, :location)
  end

end
