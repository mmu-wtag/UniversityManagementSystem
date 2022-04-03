require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user1) { User.new(email: 'iand@gmail.com', password: '123456') }
  let(:user2) { User.new(email: 'iand@gmail.com', password: '123456')}
  it 'is not valid without an email' do
    !user1.email.nil?
    expect(user1).to be_valid
  end

  it 'ensures that no double users can be created by  a single email' do
    user1.email != user2.email
    expect(user2).to be_valid
  end

end
