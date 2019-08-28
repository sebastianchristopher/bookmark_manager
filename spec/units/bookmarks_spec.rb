require 'bookmarks'

describe Bookmarks do
  context '.all' do
    it 'returns all bookmarks' do
      bookmark = Bookmarks.create('http://www.foobar.com', 'Foobar')
      last_bookmark = Bookmarks.all.last

      expect(last_bookmark.url).to eq(bookmark.url)
      expect(last_bookmark.title).to eq(bookmark.title)
      expect(last_bookmark.id).to eq(bookmark.id)
      expect(Bookmarks.all).to all(be_a(Bookmarks))
      expect(Bookmarks.all.count).to eq(4)
    end
  end
  context '.create' do
    it 'can create a bookmark' do
      bookmark = Bookmarks.create('http://www.yahoo.co.uk', 'Yahoo')
      expect(bookmark.url).to eq('http://www.yahoo.co.uk')
      expect(bookmark.title).to eq('Yahoo')
    end
    it 'can add a bookmark' do
      bookmark = Bookmarks.create('http://www.yahoo.co.uk', 'Yahoo')
      last_bookmark = Bookmarks.all.last

      expect(last_bookmark.url).to eq(bookmark.url)
      expect(last_bookmark.title).to eq(bookmark.title)
      expect(last_bookmark.id).to eq(bookmark.id)
    end
  end
end
