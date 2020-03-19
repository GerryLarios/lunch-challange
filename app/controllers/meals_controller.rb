class MealsController < ApplicationController
  helper_method :edit_allowed?
  
  def index
    @meals = Meal.all
  end

  def show
    @meal = Meal.find(params[:id])
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(name: meal_params[:name], img: meal_params[:img], user: current_user)
    if current_user.admin?
      @meal.save ? redirect_to(meals_path) : render(:new)
    else
      not_allowed_message
    end
  end

  def edit
    @meal = Meal.find(params[:id]) 
  end

  def update
    @meal = Meal.find(params[:id])
    if edit_allowed?(@meal) 
      @meal.update(meal_params) ? redirect_to(meals_path) : render(:edit)
    else
      not_allowed_message  
    end
  end

  private 

  def meal_params
    params.require(:meal).permit(:name, :img)
  end

  def not_allowed_message
    flash.now[:error] = 'You are not allowed to perform this action.'
    render(:new)
  end

  def edit_allowed?(meal)
    current_user.admin? && current_user == meal.user
  end
end
