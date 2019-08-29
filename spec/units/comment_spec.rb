require 'comment'

describe Comment do
  it 'can create a comment' do
    comment = Comment.create('3', 'This is a comment')
    expect(comment.id).to eq('4')
    expect(comment.text).to eq('This is a comment')
    expect(comment.bookmark_id).to eq('3')
  end
end
