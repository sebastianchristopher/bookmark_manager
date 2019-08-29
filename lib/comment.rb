class Comment

  def self.create(bookmark_id, text)
    rs = DatabaseConnection.query("INSERT INTO comments(text, bookmark_id) VALUES('#{text}', '#{bookmark_id}') RETURNING *;")
    Comment.new(rs[0]['id'], rs[0]['text'], rs[0]['bookmark_id'])
  end

  attr_reader :id, :text, :bookmark_id

  def initialize(id, text, bookmark_id)
    @id = id
    @text = text
    @bookmark_id = bookmark_id
  end
end
