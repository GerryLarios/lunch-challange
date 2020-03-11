class SelectionsController < ApplicationController
  def index
    @selections = Selection.all
  end

  def show
    @selection = selection_by_id
  end

  def new
    @selection = Selection.new
  end

  def create
    @selection = Selection.new(user_id: 1, meal_id: selection_params[:meal_id], month: selection_params[:month])
    @selection.save ? redirect_to(selections_path) : render('new')
  end

  private

  def selection_params
    params.require(:selection).permit(:user_id, :meal_id, :month)
  end

  def selection_by_id
    Selection.find(params[:id])
  end
end
