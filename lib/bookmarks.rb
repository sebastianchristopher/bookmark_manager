class Bookmarks
  def self.all
    con = db_connection
    rs = con.exec 'SELECT * FROM bookmarks;'
    rs.each_with_object(Array.new) { |row, bookmarks|
      bookmarks << Bookmarks.new(row['url'], row['title'])
    }
  end

  def self.create(url, title)
    con = db_connection
    con.exec "INSERT INTO bookmarks(url, title) VALUES('#{url}','#{title}');"
    Bookmarks.new(url, title)
  end

  attr_reader :url, :title

  def initialize(url, title)
    @url = url
    @title = title
  end

  private

  def self.db_connection
    if ENV['ENVIRONMENT'] == 'test'
      db_name = 'bookmark_manager_test'
    else
      db_name = 'bookmark_manager'
    end
    PG.connect :dbname => db_name
  end
end
