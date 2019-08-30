require 'bookmark_tag'

describe BookmarkTag do
  it 'can create a BookmarkTag' do
    booktag = BookmarkTag.create('1', '1')
    expect(booktag).to be_a(BookmarkTag)
    expect(booktag.id).to eq('1')
    expect(booktag.bookmark_id).to eq('1')
    expect(booktag.tag_id).to eq('1')
  end
end
