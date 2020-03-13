class SelectionsController < ApplicationController
  def index
    @selections = Selection.where('month = ?', params[:month] || current_month)
  end

  def show
    @selection = selection_by_id
  end

  def new
    @selection = Selection.new
  end

  def create
    if valid_selection?
      selections = Selection.create(selects_array)
      selections.first.id.present? ? redirect_to(selections_path) : render(:new)
    else
      flash.now[:limit] = ['You reach the limit of meals by month']
      render('new')
    end
  end

  private

  def month_param
    @month_param ||= selection_params[:month]
  end

  def meals_param
    @meals_param || params[:selection][:meal_id].drop(1)
  end

  def selection_params
    params.require(:selection).permit(:selection, :month, :meal_id)
  end

  def selection_by_id
    Selection.find(params[:id])
  end

  def current_month
    @current_month ||= Date.today.strftime("%B").downcase
  end

  def valid_selection?
   (Selection.where('month = ?', month_param).length + (meals_param.length)) <= 5
  end

  def selects_array
    array = []
    meals_param.each { |id| array << {meal_id: id, month: month_param } }
    array
  end
end
