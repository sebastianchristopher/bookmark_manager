require 'tag'

describe Tag do
  it 'has an id' do
    tag = Tag.new('1', 'Some content')
    expect(tag.id).to eq('1')
  end
  it 'has content' do
    tag = Tag.new('1', 'Some content')
    expect(tag.content).to eq('Some content')
  end
  it 'creates a new tag' do
    tag = Tag.create('This is a tag')
    expect(tag).to be_a(Tag)
    expect(tag.id).to eq('3')
    expect(tag.content).to eq('This is a tag')
  end
end
