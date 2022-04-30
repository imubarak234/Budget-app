require 'rails_helper'

RSpec.describe Group, type: :model do
  subject { Group.new(name: "Name_1", icon: "Icons", author_id: "1") }
  
  before { subject.save }

  it 'Name should be present' do
    subject.name = nil
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
