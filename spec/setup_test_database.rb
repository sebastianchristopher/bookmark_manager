require_relative '../lib/database_connection'
require 'pg'

def setup_test_database
  DatabaseConnection.query('TRUNCATE bookmarks CASCADE;')
  DatabaseConnection.query('TRUNCATE tags CASCADE;')
  rs = DatabaseConnection.query("SELECT table_name FROM information_schema.tables WHERE table_schema = 'public';")
  rs.each { |db|
    DatabaseConnection.query("ALTER SEQUENCE #{db['table_name']}_id_seq RESTART WITH 1;")
  }
  Bookmarks.create('http://www.makersacademy.com', 'Makers')
  Bookmarks.create('http://www.google.com', 'Google')
  Bookmarks.create('http://www.destroyallsoftware.com', 'Destroy All Software')
  # DatabaseConnection.query("INSERT INTO bookmarks(url, title) VALUES
  # ('http://www.makersacademy.com', 'Makers'),
  # ('http://www.google.com', 'Google'),
  # ('http://www.destroyallsoftware.com', 'Destroy All Software');")
  DatabaseConnection.query("INSERT INTO comments(text, bookmark_id) VALUES
  ('First comment', 1),
  ('Second comment', 1),
  ('Third comment', 2);")
  Tag.create('Work')
  Tag.create('Entertainment')
end
