class SelectionCompletedEmailJob < ApplicationJob
  queue_as :default
  
  def perform(selection, url)
    SelectionCompletedEmailService.new(selection, url).send_to_admin
  end
end
