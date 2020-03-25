class SelectionCompletedEmailJob < ApplicationJob
  queue_as :emails
  
  def perform(selection)
    SelectionCompletedEmailService.new(selection).send_to_admin
  end
end
