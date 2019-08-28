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

  get '/bookmarks/new' do
    erb(:add_bookmark)
  end

  post '/bookmarks' do
    Bookmarks.create(params[:url], params[:title])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
