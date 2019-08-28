require 'pg'

def setup_test_database
  con = PG.connect :dbname => 'bookmark_manager_test'
  con.exec 'TRUNCATE bookmarks;'
  con.exec "INSERT INTO bookmarks(url) VALUES('http://www.makersacademy.com'),('http://www.google.com'),('http://www.destroyallsoftware.com');"
  con.close
end
