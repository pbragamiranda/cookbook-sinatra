require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry-byebug'
require 'better_errors'
configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

require_relative 'cookbook'
require_relative 'recipe'

fp = '/home/blackmamba/code/pbragamiranda/cookbook-sinatra/'

get '/' do
  cookbook = Cookbook.new(fp + 'recipes.csv')
  @recipes = cookbook.all
  erb :index
end

get '/new_recipe' do
  erb :new_recipe
end

post '/add_recipes' do
  cookbook = Cookbook.new(fp + 'recipes.csv')
  @recipes = cookbook.all
  @recipes << Recipe.new(params['rname'], params['descp'], params['preptime'], params['diff'])
  cookbook.save
  redirect '/'
end

# delete '/destroy' do
#   cookbook = Cookbook.new(fp + 'recipes.csv')
#   @recipes = cookbook.all

#   cookbook.save
#   redirect '/'
# end

# get '/' do  # <- Router part

#   # [...]   #
#   # [...]   # <- Controller part
#   # [...]   #
