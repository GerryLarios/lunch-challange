class SelectionReminderEmailJob < ApplicationJob
  queue_as :default

  def perform(*args)
    SelectionReminderEmailService.new.send
  end
end
