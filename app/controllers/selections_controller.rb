class SelectionsController < ApplicationController
  helper_method [:list_months]

  def index
    @selections = Selection.enable(@current_user.id, params[:month] || current_month)
  end

  def show
    @selection = Selection.find(params[:id]) 
  end

  def new
    list_meals
    @selection = Selection.new
  end

  def create
    @selection = Selection.new(month: selection_params[:month], meals: meals_selected, user: @current_user)
    if @selection.save
      SelectionCompletedEmailJob.perform_later(@selection, url_for(@selection))
      # SelectionCompletedEmailService.new(@selection, url_for(@selection)).send_to_admin
      redirect_to(selections_path)
    else
      render(:new)
    end
  end

  def edit
    list_meals
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
  
  def list_meals
    @meals ||= Meal.all
  end

  def meals_selected
    meals_param.map { |id| Meal.find(id) }
  end

  def list_months
    [:january, :february, :march, :april, :may, :june, :july, :august, :september, :octuber, :november, :december]
  end
end
