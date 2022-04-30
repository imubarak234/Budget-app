require 'rails_helper'

RSpec.describe Log, type: :model do
  subject { Log.new(record_id: 1, group_id: 1) }
  
  before { subject.save }

  it 'Record ID should be present' do 
    subject.record_id = nil
    expect(subject).to_not be_valid  
  end

  it 'Group ID should be present' do 
    subject.group_id = nil
    expect(subject).to_not be_valid  
  end
end
