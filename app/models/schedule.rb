class Schedule < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable

  belongs_to :teacher, :class_name => "User", :foreign_key => "teacher_id"
  belongs_to :student, :class_name => "User", :foreign_key => "student_id"
end
end
