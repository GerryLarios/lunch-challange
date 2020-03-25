class SelectionCompletedEmailService
  def initialize(selection)
    @selection = selection
  end

  def send_to_admin
    AdminMailer.with(selection: @selection).selection_completed.deliver if completed?
  end
  
  private

  def completed?
    @selection.meals.length == Selection.meals_allowed
  end
end
