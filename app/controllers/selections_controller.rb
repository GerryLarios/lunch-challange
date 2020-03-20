class SelectionsController < ApplicationController
  helper_method [:list_months, :list_meals]

  def index
    @selections = Selection.enable(@current_user.id, params[:month] || current_month)
  end

  def show
    @selection = Selection.find(params[:id]) 
  end

  def new
    @selection = Selection.new
  end

  def create
    @selection = Selection.new(month: selection_params[:month], meals: meals_selected, user: @current_user)
    @selection.save ? redirect_to(selections_path) : render(:new)
  end

  def edit
    @selection = Selection.find(params[:id])
  end

  def update
    @selection = Selection.find(params[:id])
    @selection.update(meals: meals_selected) ? redirect_to(selections_path) : render(:edit)
  end

  private
  
  def selection_params
    params.require(:selection).permit!
  end

  def meals_param
    @meals_param ||= selection_params[:meals].drop(1)
  end
  
  def current_month
    @current_month ||= Date.today.strftime("%B").downcase
  end

  def meals_selected
    meals_param.map { |id| Meal.find(id) }
  end

  def list_meals
    Meal.all
  end

  def list_months
    [:january, :february, :march, :april, :may, :june, :july, :august, :september, :octuber, :november, :december]
  end
end
