feature 'bookmarks/edit' do
  scenario 'redirect to edit page' do
    visit '/bookmarks'
    first('.bookmark').click_button 'edit'
    expect(page).to have_current_path('/bookmarks/1/edit')
  end
  scenario 'has an edit form if valid id' do
    visit '/bookmarks'
    first('.bookmark').click_button 'edit'
    expect(find_field('title').value).to eq('Makers')
  end
  scenario 'can edit a bookmark title' do
    visit '/bookmarks'
    first('.bookmark').click_button 'edit'
    fill_in('title', with: 'Academy')
    click_button 'Submit'
    expect(page).to have_link('Academy', href: 'http://www.makersacademy.com')
  end
  scenario 'can edit a bookmark url' do
    visit '/bookmarks'
    first('.bookmark').click_button 'edit'
    fill_in('url', with: 'http://www.makers.com')
    click_button 'Submit'
    expect(page).to have_link('Makers', href: 'http://www.makers.com')
  end
end
