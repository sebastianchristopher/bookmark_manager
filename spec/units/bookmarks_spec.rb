require 'bookmarks'

describe Bookmarks do

  context '.all' do
    it 'returns all bookmarks' do
      bookmark = Bookmarks.create('http://www.foobar.com', 'Foobar')
      last_bookmark = Bookmarks.all.last
      expect(last_bookmark.url).to eq(bookmark.url)
      expect(last_bookmark.title).to eq(bookmark.title)
      expect(Bookmarks.all).to all( be_a(Bookmarks) )
      expect(Bookmarks.all.count).to eq(4)
    end
  end
  context '.create' do
    it 'can create a bookmark' do
      bm = Bookmarks.create('http://www.yahoo.co.uk', 'Yahoo')
      expect(bm.url).to eq('http://www.yahoo.co.uk')
      expect(bm.title).to eq('Yahoo')
    end
  end
end
