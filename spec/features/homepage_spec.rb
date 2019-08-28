feature 'homepage' do

  scenario 'show list of saved bookmarks' do
    visit '/bookmarks'
    expect(page).to have_tag('li', :text => 'http://www.makersacademy.com')
    expect(page).to have_tag('li', :text => 'http://www.google.com')
    expect(page).to have_tag('li', :text => 'http://www.destroyallsoftware.com')
  end
  scenario 'add bookmark' do
    visit '/bookmarks'
    fill_in('url', :with => 'http://www.bbc.co.uk')
    click_button(:Add)
    expect(page).to have_tag('li', :text => 'http://www.bbc.co.uk')
  end
end
