class Tag
  def self.create(content)
    rs = DatabaseConnection.query("INSERT INTO tags (content) VALUES ('#{content}') RETURNING *;")
    Tag.new(rs[0]['id'], rs[0]['content'])
  end

  attr_reader :id, :content

  def initialize(id, content)
    @id = id
    @content = content
  end
end
