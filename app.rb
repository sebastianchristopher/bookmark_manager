require 'sinatra/base'
require 'sinatra/flash'
require 'pg'
require 'uri'
require_relative 'lib/bookmarks'
require_relative 'lib/comment'
require_relative 'lib/tag'
require_relative 'lib/bookmark_tag'
require_relative 'lib/database_connection_setup'

class BookmarkApp < Sinatra::Base
  enable :method_override, :sessions
  register Sinatra::Flash

  get '/' do
    erb(:index)
  end

  get '/bookmarks' do
    @bookmarks = Bookmarks.all
    erb(:'bookmarks/index')
  end

  get '/bookmarks/new' do
    erb(:'bookmarks/new')
  end

  get '/bookmarks/:id/edit' do
    @bookmark = Bookmarks.find(params[:id])
    redirect '/bookmarks' if @bookmark.nil?
    erb(:'bookmarks/edit')
  end

  get '/bookmarks/comments/:id/edit' do
    @id = params[:id]
    erb(:'comments/index')
  end

  post '/bookmarks/comments' do
    Comment.create(params[:id], params[:text])
    redirect '/bookmarks'
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
