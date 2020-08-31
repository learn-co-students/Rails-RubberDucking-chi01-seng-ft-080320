class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def show
    find_student
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.create(student_params)

    if @student.valid?
      flash[:success] = "Welcome #{@student.name}!"
      redirect_to student_path(@student)
    else
      flash[:errors] = @student.errors.full_messages
      redirect_to new_student_path
    end
    
  end #end of create action

  def edit
    find_student
  end

  def update 
  # because .update when run on an instance does return true or false
  # no need for .valid?
    find_student
    if @student.update(student_params)
      flash[:success] = "Profile successfully updated!"
      redirect_to student_path(@student)
    else
      flash[:errors] = @student.errors.full_messages
      redirect_to edit_student_path
    end

  end

  private

  def find_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name, :mod)
  end

end #end of StudentsController class
