RSpec.describe 'Group Index', type: :feature do
  let(:user) { FactoryBot.create(:user) } 

  it 'Check for exisiting content' do
    visit '/groups'

    group_one = Group.create(name: "first group", icon: "icon1", author_id: 1)
    group_two = Group.create(name: "first group", icon: "icon1", author_id: 1)

    expect(page).to have_content(group_one.name)
    expect(page).to have_content(group_two.name)
  end
end