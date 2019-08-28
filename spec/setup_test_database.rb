require 'pg'

def setup_test_database
  con = PG.connect :dbname => 'bookmark_manager_test'
  con.exec 'TRUNCATE bookmarks;'
  con.exec "INSERT INTO bookmarks(url, title) VALUES
  ('http://www.makersacademy.com', 'Makers'),
  ('http://www.google.com', 'Google'),
  ('http://www.destroyallsoftware.com', 'Destroy All Software');"
  con.close
end
