class SelectionReminderEmailJob < ApplicationJob
  queue_as :emails

  def perform(*args)
    SelectionReminderEmailService.new.send
  end
end
