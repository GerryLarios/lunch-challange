require 'rails_helper'

RSpec.describe SelectionReminderEmailJob, type: :job do
  it 'process the email job on emails' do
    expect(SelectionReminderEmailJob). to be_processed_in :emails
  end
end
