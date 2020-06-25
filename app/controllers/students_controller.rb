class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def show 
    @student = current_student 
  end 

  def new 
    @student = Student.new 
    @instructors = Instructor.all 
  end

  def create 
    @student = Student.new(student_params) 
    if @student.valid? 
      @student.save 
      redirect_to instructor_path(@student.instructor) 
    else 
      flash[:errors] = @student.errors.full_messages 
      redirect_to "/students/new" 
    end 
  end 

  def edit 
    @student = current_student
    @instructors = Instructor.all
  end 

  def update 
    @student = current_student 
    @student.update(student_params)
    if @student.valid? 
      @student.save 
      redirect_to student_path(@student) 
    else 
      flash[:errors] = @student.errors.full_messages 
      redirect_to edit_student_path(@student)  
    end 
  end 

  def current_student
    Student.find(params[:id]) 
  end 

  def student_params 
    params.require(:student).permit(:name, :age, :major, :instructor_id)
  end 
  
end
