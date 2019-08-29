class Bookmarks
  def self.all
    rs = DatabaseConnection.query('SELECT * FROM bookmarks ORDER BY id;')
    rs.map { |row| Bookmarks.new(row['url'], row['title'], row['id']) }
  end

  def self.create(url, title)
    return false unless valid_url?(url)
    rs = DatabaseConnection.query("INSERT INTO bookmarks(url, title) VALUES('#{url}','#{title}') RETURNING *;")
    Bookmarks.new(rs[0]['url'], rs[0]['title'], rs[0]['id'])
  end

  def self.delete(id)
    DatabaseConnection.query("DELETE FROM bookmarks WHERE id = #{id};")
  end

  def self.find(id)
    rs = DatabaseConnection.query("SELECT * FROM bookmarks WHERE id = #{id};")
    Bookmarks.new(rs[0]['url'], rs[0]['title'], rs[0]['id']) unless rs.to_a.empty?
  end

  def self.edit(id, url, title)
    rs = DatabaseConnection.query("UPDATE bookmarks SET url = '#{url}', title = '#{title}' WHERE id = #{id}  RETURNING *;")
    Bookmarks.new(rs[0]['url'], rs[0]['title'], rs[0]['id'])
  end

  attr_reader :url, :title, :id

  def initialize(url, title, id)
    @url = url
    @title = title
    @id = id
  end

  def comments
    rs = DatabaseConnection.query("SELECT * FROM comments WHERE bookmark_id = #{@id} ORDER BY id;")
    rs.map { |row| Comment.new(row['id'], row['text'], row['bookmark_id']) }
  end

  private_class_method def self.valid_url?(url)
    # (url =~ URI::regexp).nil? == false
    (url =~ URI::DEFAULT_PARSER.make_regexp).nil? == false
  end
end
