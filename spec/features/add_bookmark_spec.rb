feature 'bookmarks/new' do
  scenario 'add bookmark' do
    visit '/bookmarks/new'
    fill_in('url', :with => 'http://www.foobar.co.uk')
    fill_in('title', with: 'Foobar')
    click_button(:Add)
    expect(page).to have_link('Foobar', href: 'http://www.foobar.co.uk')
  end
end
