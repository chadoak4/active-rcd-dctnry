require 'sqlite3'
require 'active_record'
require 'sinatra'
require 'sinatra/reloader'


ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: File.dirname(__FILE__) + "/dictionary1.sqlite3"
)

require 'erb'
Tilt.register Tilt::ERBTemplate, 'html.erb'

class Definition < ActiveRecord::Base
  :word
  :meaning
end

get '/' do

  erb :index
end

get '/add' do
  erb :add
end

post '/save' do

  word = params["word"]
  definition = params["definition"]
  new_entry = Definition.create(word: word, meaning: definition)

  redirect to '/'
end

post '/search' do

  results = Definition.find_by(word: params["q"])
  @words_found = " Word: #{results.word}"
  @definition_found = "Definition: #{results.meaning}"


  erb :search
end
