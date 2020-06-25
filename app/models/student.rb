class Student < ApplicationRecord
    belongs_to :instructor

    validates :name, presence: true 
    validate :is_age_above_eighteen? 

    def is_age_above_eighteen? 
        unless self.age == nil 
            if self.age < 18 
                errors.add(:age, "must be 18 or above!") 
            end   
        end 
    end 

end 
