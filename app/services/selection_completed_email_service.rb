class SelectionCompletedEmailService
  def initialize(selection, url)
    @selection = selection
    @url = url
  end

  def send_to_admin
    AdminMailer.with(selection: @selection, url: @url).selection_completed.deliver_later if completed?
  end
  
  private

  def completed?
    @selection.meals.length == Selection.meals_allowed
  end
end
