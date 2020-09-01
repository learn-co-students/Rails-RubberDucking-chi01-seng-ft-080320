class DucksController < ApplicationController
  before_action :find_duck, only: [:show, :edit, :update]

  def index
    @ducks = Duck.all
  end

  def show
 
  end

  def new
    @duck = Duck.new

    @students = Student.all
  end

  def create
    @duck = Duck.create(duck_params)

    if @duck.valid?
      flash[:success] = "Welcome #{@duck.name}!"
      redirect_to duck_path(@duck)
    else
      flash[:errors] = @duck.errors.full_messages
      redirect_to new_duck_path
    end
    
  end #end of create action


  def edit
    @students = Student.all
  end

  def update 
  # because .update when run on an instance does return true or false
  # no need for .valid?
    if @duck.update(duck_params)
      flash[:success] = "Duck Profile Successfully Updated!"
      redirect_to duck_path(@duck)
    else
      flash[:errors] = @duck.errors.full_messages
      redirect_to edit_duck_path
    end

  end #end of update method

  def find_duck
    @duck = Duck.find(params[:id])
  end

  def duck_params
    params.require(:duck).permit(:name, :description, :student_id)
  end


end #end of d controller
