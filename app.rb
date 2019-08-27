require 'sinatra/base'
require 'pg'
require_relative 'lib/bookmarks'

class BookmarkApp < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get '/bookmarks' do
    p ENV['RACK_ENV']
    @bookmarks = Bookmarks.all
    erb(:bookmarks)
  end

  run! if app_file == $0
end
