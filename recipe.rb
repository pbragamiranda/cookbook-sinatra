class Recipe
  attr_accessor :name, :description, :prep_time, :diff, :cooked

  def initialize(name, description, prep_time, diff, cooked = false)
    @name = name
    @description = description
    @prep_time = prep_time
    @diff = diff
    @cooked = false
  end

  def mark_cooked
    @cooked = true
  end

  def cooked?
    @cooked
  end
end
