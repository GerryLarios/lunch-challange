class MealsController < ApplicationController
  def index
    @meals = Meal.all
  end

  def show
    @meal = meal_by_id 
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(meal_params)
    @meal.save ? redirect_to(meals_path) : render('new')
  end

  private 

  def meal_by_id
    Meal.find(params[:id])
  end

  def meal_params
    params.require(:meal).permit(:name, :img)
  end
end
