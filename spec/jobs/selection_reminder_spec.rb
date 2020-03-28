require 'rails_helper'

RSpec.describe SelectionReminderEmailJob, type: :job do
  it 'process the email job on emails' do
    ActiveJob::Base.queue_adapter = :test
    expect { SelectionReminderEmailJob.perform_later }.to have_enqueued_job
  end
end
