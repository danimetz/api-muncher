require 'test_helper'

describe EdamamApiWrapper do
  it 'can list recipes' do
    VCR.use_cassette('recipes') do
      recipes = EdamamApiWrapper.list_recipes("key lime")

      expect(recipes.length).must_be :>, 0
      recipes.each do |recipe|
        expect(recipe).must_be_kind_of Recipe
        expect(recipe).must_respond_to :label
        expect(recipe).must_respond_to :id
        expect(recipe).must_respond_to :url
        expect(recipe).must_respond_to :image
        expect(recipe).must_respond_to :ingredients
        expect(recipe).must_respond_to :health
      end
    end
  end

  it 'can return one recipe' do
    VCR.use_cassette('recipe') do
      recipe = EdamamApiWrapper.find_recipe("7dae816aa7c847f2842be8e1360ddd60")

      expect(recipe).must_be_kind_of Recipe
      expect(recipe).must_respond_to :label
      expect(recipe).must_respond_to :id
      expect(recipe).must_respond_to :url
      expect(recipe).must_respond_to :image
      expect(recipe).must_respond_to :ingredients
      expect(recipe).must_respond_to :health

    end
  end
end
