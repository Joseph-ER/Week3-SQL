require 'recipe_directory'
require 'recipe'


def reset_recipes_table
  seed_sql = File.read('spec/seed_recipe_directory.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
  connection.exec(seed_sql)
end

describe RecipeRepository do
  before(:each) do 
    reset_recipes_table
  end


  it "Returns all recipes in the database " do
    recipe_repo = RecipeRepository.new

    recipes = recipe_repo.all

    expect(recipes.length).to eq (4)
    expect(recipes.first.id).to eq (1)
    expect(recipes.first.name).to eq ('Rice')
    expect(recipes.first.cooking_time).to eq (10)
    expect(recipes.first.rating).to eq (2)

  end

  it "find returns only specific items where rating == 2" do
    recipe_repo = RecipeRepository.new

    found_recipes = recipe_repo.find(2)

    expect(found_recipes.length).to eq(2)
    expect(found_recipes.first.name).to eq('Rice')
    expect(found_recipes[1].name).to eq('Sandwich')



  end

end