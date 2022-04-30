RSpec.describe 'Group Index', type: :feature do
  let(:user) { FactoryBot.create(:user) } 
  before :each do
    one = User.create(email: 'user1@gmail.com', password: 'password', name: 'User1')

    Group.create(name: "first group", icon: "bi bi-search", author_id: 1)

    visit '/users/sign_in'
    fill_in 'Email', with: 'user1@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
  end

  it 'Check for exisiting content' do
    visit '/'

    group_one = Group.create(name: "first group", icon: "bi bi-search", author_id: 1)
    group_two = Group.create(name: "first group", icon: "bi bi-search", author_id: 1)

    expect(page).to have_content(group_one.name)
    expect(page).to have_content(group_two.name)
  end
end