feature 'edit bookmarks' do

scenario 'delete a bookmark' do
  visit '/bookmarks'
  first('.bookmark').click_button 'edit'
  expect(page).to_not have_link('Makers', href: 'http://www.makersacademy.com')
end
