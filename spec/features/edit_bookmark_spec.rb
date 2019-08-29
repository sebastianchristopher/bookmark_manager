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
  end
  scenario 'can edit a bookmark url' do
  end
end
