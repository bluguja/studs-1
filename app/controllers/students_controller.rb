class StudentsController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.undefined?
      redirect_to edit_user_registration_path
    else
      @students = current_user.students.uniq
    end
  end

  def show
    @student = student.find(params[:id])
    @schedules = @student.schedules
  end
end
