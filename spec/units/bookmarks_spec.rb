require 'bookmarks'

describe Bookmarks do
  it 'returns all bookmarks' do
    expect(Bookmarks.all).to eq(["http://www.makersacademy.com", "http://www.google.com", "http://www.destroyallsoftware.com"])
  end
  it 'can add a bookmark' do
    Bookmarks.add('http://www.yahoo.co.uk')
    expect(Bookmarks.all).to include('http://www.yahoo.co.uk')
  end
  xit 'can add a title with a bookmark' do
    bookmark = Bookmark.new('http://www.yahoo.co.uk', 'Yahoo')

    expect(Bookmarks.all).to include('Yahoo http://www.yahoo.co.uk')
  end
end
