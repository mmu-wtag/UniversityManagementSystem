require 'rails_helper'

RSpec.describe Course, type: :model do
  let(:course1) { Course.new(course_code: 'ECO104', course_title: 'Macroeconomics', department_id: 2, teacher_id: 2) }
  let(:course2) { Course.new(course_code: 'ECO104', course_title: 'Macroeconomics', department_id: 2, teacher_id: 2) }

  it 'is not valid without a course code' do
    !course1.course_code.nil?
    expect(course1).not_to be_valid
  end

  it 'is not valid without a course title' do
    !course1.course_title.nil?
    expect(course1).not_to be_valid
  end

  it 'is not valid without a department' do
    !course1.department_id.nil?
    expect(course1).not_to be_valid
  end

  it 'is not valid without a teacher' do
    !course1.teacher_id.nil?
    expect(course1).not_to be_valid
  end

  it 'ensures that no two course has the same course code' do
    course1.course_code == course2.course_code
    expect(course2).not_to be_valid
  end

end
