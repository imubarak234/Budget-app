RSpec.describe 'Group New', type: :feature do
  before :each do
    User.create(email: 'user1@gmail.com', password: 'password', name: 'User1')

    Group.create(name: 'first group', icon: 'bi bi-search', author_id: 1)

    visit '/users/sign_in'
    fill_in 'Email', with: 'user1@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
  end

  it 'Check for appropiate responds from form' do
    visit '/groups/1/records/new'

    fill_in 'Name', with: 'testings'
    fill_in 'Amount', with: 22
    find("option[value='1']").click
    click_button 'Save'

    expect(page).to have_content('Transaction created successfully')
  end
end
