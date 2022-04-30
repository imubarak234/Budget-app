RSpec.describe 'Record Index', type: :feature do
  before :each do
    User.create(email: 'user1@gmail.com', password: 'password', name: 'User1')

    Record.create(name: "Third record", amount: 5.0, author_id: 1)

    Log.create(group_id: 1, record_id: 1)

    visit '/users/sign_in'
    fill_in 'Email', with: 'user1@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
  end

  it 'Check for exisiting content' do
    
    Group.create(name: "first group", icon: "bi bi-search", author_id: 1)

    one_record = Record.create(name: "First record", amount: 4.7, author_id: 1)
    two_record = Record.create(name: "Second record", amount: 7.7, author_id: 1)

    Log.create(group_id: 1, record: one_record)
    Log.create(group_id: 1, record_id: 3)

    visit '/groups/1/records'
    

    expect(page).to have_content(one_record.name)
    expect(page).to have_content(two_record.name)
    expect(page).to have_content(two_record.amount)
    expect(page).to have_content(two_record.amount)
  end
end