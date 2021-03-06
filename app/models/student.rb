# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(query)
   if query == "" 
    self.all
   else
    q_names = []
    self.all.map do |s| 
      if s.name.downcase.include? query 
        q_names << s
      end
    end
    
    q_names
   end

  end

  
  
end
