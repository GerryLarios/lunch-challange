class SelectionCompletedEmailJob < ApplicationJob
  queue_as :emails
  
  def perform(selection, url)
    SelectionCompletedEmailService.new(selection, url).send_to_admin
  end
end
