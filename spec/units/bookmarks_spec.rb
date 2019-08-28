require 'bookmarks'

describe Bookmarks do
  it 'returns all bookmarks' do
    expect(Bookmarks.all).to eq(["http://www.makersacademy.com", "http://www.google.com", "http://www.destroyallsoftware.com", "http://www.google.com/search?q=wizard+of+oz"])
  end
end
