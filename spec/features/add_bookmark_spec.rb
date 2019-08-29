feature 'bookmarks/new' do
  scenario 'add bookmark' do
    visit '/bookmarks/new'
    fill_in('url', with: 'http://www.foobar.co.uk')
    fill_in('title', with: 'Foobar')
    click_button(:Add)
    expect(page).to have_link('Foobar', href: 'http://www.foobar.co.uk')
  end
  scenario 'add invalid bookmark' do
    visit '/bookmarks/new'
    fill_in('url', with: 'foobar.co.uk')
    fill_in('title', with: 'Foobar')
    click_button(:Add)
    p current_path
    expect(page).to have_content('Bookmark id not found')
  end
end
