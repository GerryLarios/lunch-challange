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
    @meal = Meal.new(name: meal_params[:name], img: meal_params[:img], user: current_user)
    if current_user.admin?
      @meal.save ? redirect_to(meals_path) : render(:new)
    else
      flash.now[:error] = 'You are not allowed to perform this action.'
      render(:new)
    end
  end

  private 

  def meal_by_id
    Meal.find(params[:id])
  end

  def meal_params
    params.require(:meal).permit(:name, :img)
  end
end
