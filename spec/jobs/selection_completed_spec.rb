require 'rails_helper'

RSpec.describe SelectionCompletedEmailJob, type: :job do
  it 'process the email job on emails' do
    ActiveJob::Base.queue_adapter = :test
    selection = create(:selection)
    expect { SelectionCompletedEmailJob.perform_later(selection) }.to have_enqueued_job
  end
end
