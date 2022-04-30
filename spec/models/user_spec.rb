require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tests', email: 'example@gmail.com', password: 'newpassword') }

  before { subject.save }

  it 'Name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Email should be present' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'Name length should not be to long' do
    subject.name = 'a' * 110
    expect(subject).to_not be_valid
  end

  it 'Name length should not be too short' do
    subject.name = 'a'
    expect(subject).to_not be_valid
  end
end
