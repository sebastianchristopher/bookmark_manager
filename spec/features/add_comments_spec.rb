feature 'adds comments' do
  scenario 'can add a comment to a bookmark' do
    visit '/bookmarks'
    first('.bookmark').click_button 'add comment'
    fill_in('text', with: 'Coding school')
    click_button 'Submit'
    expect(page).to have_content('Coding school')
  end
end
