require 'sinatra/base'
require 'sinatra/flash'
require 'pg'
require 'uri'
require_relative 'lib/bookmarks'
require_relative 'lib/database_connection_setup'

class BookmarkApp < Sinatra::Base
  enable :method_override, :sessions
  register Sinatra::Flash

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

  get '/bookmarks/:id/edit' do
    @bookmark = Bookmarks.find(params[:id])
    redirect '/bookmarks' if @bookmark.nil?
    erb(:edit)
  end

  patch '/bookmarks/:id' do
    Bookmarks.edit(params[:id], params[:url], params[:title])
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id/delete' do
    Bookmarks.delete(params[:id])
    redirect '/bookmarks'
  end

  post '/bookmarks' do
    flash[:notice] = 'Bookmark id not found' unless Bookmarks.create(params[:url], params[:title])
    redirect '/bookmarks'
  end

  # run! if app_file == $0
  run! if app_file == $PROGRAM_NAME
end
