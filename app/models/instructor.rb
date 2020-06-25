class Instructor < ApplicationRecord
    has_many :students


    def sort_students 
        self.students.sort_by{|student| student.name} 
    end 

    def average_student_age 
        sum = 0.0 
        total = 0.0 
        self.students.each do |student| 
            if student.age 
                sum += student.age 
                total += 1 
            end 
        end 
        unless sum = 0 
            return sum / total
        else return "No age information"
        end   
    end 
end
