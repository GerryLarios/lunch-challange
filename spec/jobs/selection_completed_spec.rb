require 'rails_helper'

RSpec.describe SelectionCompletedEmailJob, type: :job do
  it 'process the email job on emails' do
    expect(SelectionCompletedEmailJob).to be_processed_in :emails
  end
end
