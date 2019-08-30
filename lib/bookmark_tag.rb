class BookmarkTag
  def self.create(bookmark_id, tag_id)
    rs = DatabaseConnection.query("INSERT INTO bookmarks_tags (bookmark_id, tag_id) VALUES ('#{bookmark_id}', '#{tag_id}') RETURNING *;")
    BookmarkTag.new(rs[0]['id'], rs[0]['bookmark_id'], rs[0]['tag_id'])
  end

  attr_reader :id, :bookmark_id, :tag_id

  def initialize(id, bookmark_id, tag_id)
    @id = id
    @bookmark_id = bookmark_id
    @tag_id = tag_id
  end
end
