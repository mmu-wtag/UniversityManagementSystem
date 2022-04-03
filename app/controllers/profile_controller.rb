class ProfileController < ApplicationController
  def index
    @user=User.find(params[:id])
    # render json: @user
    render 'profile/index'
  end
  def details
    @course = Course.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :phone, :department_id)
  end
  def course_params
    params.require(:course).permit(:course_code, :course_title, :teacher_id, :department_id, :semester, :course_credit)
  end
end
