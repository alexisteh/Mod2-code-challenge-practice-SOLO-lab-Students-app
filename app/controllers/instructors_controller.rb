class InstructorsController < ApplicationController

  def index
    @instructors = Instructor.all
  end

  def show 
    @instructor = current_instructor  
  end 

  def current_instructor
    Instructor.find(params[:id]) 
  end 

  def instructor_params
    params.require(:instructor).permit(:name) 
  end 

end
