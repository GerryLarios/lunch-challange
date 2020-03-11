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
    bunch_selections = []
    params[:selection][:meal_id].each do |id| 
       if id != ''
         bunch_selections << { user_id: 1, meal_id: id, month: selection_params[:month] }
       end
    end
    Selection.create(bunch_selections) ? redirect_to(selections_path) : render('new')
  end

  private

  def selection_params
    params.require(:selection).permit(:user_id, :meal_id, :month)
  end

  def selection_by_id
    Selection.find(params[:id])
  end
end
