require 'rails_helper'

RSpec.describe Record, type: :model do
  subject { Record.new(name: 'Tester', amount: 23) }

  before { subject.save }

  it 'Name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Amount should be greater than or equals to 0' do
    subject.amount = -1
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
