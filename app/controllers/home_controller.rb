class HomeController < ApplicationController
  def index
    @student_count = Student.count
    @teacher_count = Teacher.count
    @teachers = Teacher.order(:name).limit(3)
  end
end
