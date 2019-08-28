feature '/bookmarks' do

  scenario 'show list of saved bookmarks' do
    visit '/bookmarks'
    expect(page).to have_tag('li', href: 'http://www.makersacademy.com')
    expect(page).to have_tag('li', href: 'http://www.google.com')
    expect(page).to have_tag('li', href: 'http://www.destroyallsoftware.com')
  end
  scenario 'delete a bookmark' do
    visit '/bookmarks'
    first('.bookmark').click_button 'delete'
    expect(page).to_not have_link('Makers', href: 'http://www.makersacademy.com')
  end
end
