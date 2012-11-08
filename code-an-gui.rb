require 'rubygems'
require 'bundler'
require 'json'
Bundler.require :default


conn = Mongo::Connection.new
db = conn['code-an']

get '/' do
  erb :index
end

get '/project/:project' do
    erb :project
end

get '/workspace/:workspace' do
    erb :workspace
end

get '/data/:analyzer' do
    content_type :json
    db[params[:analyzer]].find_one.to_json
end