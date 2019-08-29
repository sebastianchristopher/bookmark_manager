require_relative '../lib/database_connection'
require 'pg'

def setup_test_database
  DatabaseConnection.query('TRUNCATE bookmarks;')
  DatabaseConnection.query('ALTER SEQUENCE bookmarks_id_seq RESTART WITH 1;')
  DatabaseConnection.query("INSERT INTO bookmarks(url, title) VALUES
  ('http://www.makersacademy.com', 'Makers'),
  ('http://www.google.com', 'Google'),
  ('http://www.destroyallsoftware.com', 'Destroy All Software');")
end
