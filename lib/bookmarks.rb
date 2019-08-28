class Bookmarks
  def self.all
    con = db_connection
    rs = con.exec 'SELECT * FROM bookmarks;'
    # rs.each_with_object(Array.new) { |row, bookmarks|
    #   bookmarks << Bookmarks.new(row['url'], row['title'], row['id'])
    # }
    rs.map { |row| Bookmarks.new(row['url'], row['title'], row['id']) }
  end

  def self.create(url, title)
    con = db_connection
    rs = con.exec "INSERT INTO bookmarks(url, title) VALUES('#{url}','#{title}') RETURNING *;"
    Bookmarks.new(rs[0]['url'], rs[0]['title'], rs[0]['id'])
  end

  def self.delete(id)
    con = db_connection
    con.exec "DELETE FROM bookmarks WHERE id = #{id};"
  end

  attr_reader :url, :title, :id

  def initialize(url, title, id)
    @url = url
    @title = title
    @id = id
  end

  private_class_method

  def self.db_connection
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect dbname: 'bookmark_manager_test'
    else
      PG.connect dbname: 'bookmark_manager'
    end
  end
end
