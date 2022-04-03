require 'rails_helper'

RSpec.describe Student, type: :model do
  let(:student1) { Teacher.new(email: 'ianfgdsfgfd@gmail.com', password: '123456', department_id: 2) }

  it 'is not valid without an email' do
    !student1.email.nil?
    expect(student1).not_to be_valid
  end

  it 'ensures that a teacher has been assigned to a department during creation' do
    !student1.department_id.nil?
    expect(student1).not_to be_valid
  end

end
