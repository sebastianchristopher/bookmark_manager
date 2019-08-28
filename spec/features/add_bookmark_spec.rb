feature 'bookmarks/new' do
  scenario 'add bookmark' do
    visit '/bookmarks/new'
    fill_in('url', :with => 'http://www.bbc.co.uk')
    click_button(:Add)
    expect(page).to have_tag('li', :text => 'http://www.bbc.co.uk')
  end
end
