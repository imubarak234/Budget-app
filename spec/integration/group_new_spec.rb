RSpec.describe 'Group New', type: :feature do 
  before :each do
    one = User.create(email: 'user1@gmail.com', password: 'password', name: 'User1')

    Group.create(name: "first group", icon: "bi bi-search", author_id: 1)

    visit '/users/sign_in'
    fill_in 'Email', with: 'user1@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
  end

  it 'Check for appropiate responds from form' do
    visit '/groups/new'

    fill_in 'Name', with: 'testings'
    choose('groups_icon_bi_bi-award-fill')
    click_button 'Save'

    group_one = Group.create(name: "first group", icon: "bi bi-search", author_id: 1)
    group_two = Group.create(name: "first group", icon: "bi bi-search", author_id: 1)

    expect(page).to have_content("Catagory created successfully")
  end
end