class Bookmarks
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      dbname = 'bookmark_manager_test'
    else
      dbname = 'bookmark_manager'
    end
    con = PG.connect :dbname => dbname
    rs = con.exec 'SELECT url FROM bookmarks;'
    rs.each_with_object(Array.new) { |row, bookmarks| bookmarks << row['url'] }
  end

  def self.add(url)
    if ENV['ENVIRONMENT'] == 'test'
      dbname = 'bookmark_manager_test'
    else
      dbname = 'bookmark_manager'
    end
    con = PG.connect :dbname => dbname
    con.exec "INSERT INTO bookmarks(url) VALUES('#{url}');"
  end
end
