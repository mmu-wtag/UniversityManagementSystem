require 'rails_helper'

RSpec.describe Teacher, type: :model do
  let(:teacher1) { Teacher.new(email: 'ianfgdsfgfd@gmail.com', password: '123456', department_id: 2) }

  it 'is not valid without an email' do
    !teacher1.email.nil?
    expect(teacher1).not_to be_valid
  end

  it 'ensures that a teacher has been assigned to a department during creation' do
    !teacher1.department_id.nil?
    expect(teacher1).not_to be_valid
  end

end
