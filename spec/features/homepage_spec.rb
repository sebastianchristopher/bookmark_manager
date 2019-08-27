feature 'homepage' do

  scenario 'show list of saved bookmarks' do
    # allow(Bookmarks).to receive(:all).and_return(["http://www.makersacademy.com", "http://www.google.com", "http://www.destroyallsoftware.com", "http://www.google.com/search?q=wizard+of+oz"])
    visit '/bookmarks'
    expect(page).to have_tag('li', :text => 'http://www.makersacademy.com')
    expect(page).to have_tag('li', :text => 'http://www.google.com')
    expect(page).to have_tag('li', :text => 'http://www.destroyallsoftware.com')
  end
end
