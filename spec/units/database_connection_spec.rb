require 'database_connection'

describe DatabaseConnection do
  it 'takes a db name and connects to that db' do
    db_connection = DatabaseConnection.setup('bookmark_manager_test')
    expect(db_connection.db).to eq('bookmark_manager_test')
  end
  it 'takes a SQL string and queries' do
    DatabaseConnection.setup('bookmark_manager_test')
    returned_row = DatabaseConnection.query('SELECT * FROM bookmarks WHERE id = 1;').to_a.pop
    expect(returned_row['id']).to eq('1')
    expect(returned_row['title']).to eq('Makers')
    expect(returned_row['url']).to eq('http://www.makersacademy.com')
  end
end
