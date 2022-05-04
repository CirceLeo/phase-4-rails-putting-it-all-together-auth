class RecipesController < ApplicationController

    def index
        render json: Recipe.all, status: :created
    end
end
