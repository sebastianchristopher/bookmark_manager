require 'sinatra/base'
require 'pg'
require_relative 'lib/bookmarks'

class BookmarkApp < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get '/bookmarks' do
    @bookmarks = Bookmarks.all
    erb(:bookmarks)
  end

  post '/add-bookmark' do
    Bookmarks.add(params[:url])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
