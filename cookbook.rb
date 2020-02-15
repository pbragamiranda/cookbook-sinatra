require "csv"
require_relative "recipe"

class Cookbook
  def initialize(csv_file_path = nil)
    # loads csv
    @filepath = csv_file_path
    @recipes = []
    if csv_file_path
      CSV.foreach(csv_file_path) do |recipe|
        @recipes << Recipe.new(recipe[0], recipe[1], recipe[2], recipe[3], recipe[4])
      end
    end
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    if @filepath
      CSV.open(@filepath, 'wb', col_sep: ',') do |csv|
        @recipes.each { |e| csv << [e.name, e.description, e.prep_time, e.diff, e.cooked] }
      end
    end
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    if @filepath
      CSV.open(@filepath, 'wb', col_sep: ',') do |csv|
        @recipes.each { |e| csv << [e.name, e.description, e.prep_time, e.diff, e.cooked] }
      end
    end
  end

  def save
    if @filepath
      CSV.open(@filepath, 'wb', col_sep: ',') do |csv|
        @recipes.each { |e| csv << [e.name, e.description, e.prep_time, e.diff, e.cooked] }
      end
    end
  end
end
