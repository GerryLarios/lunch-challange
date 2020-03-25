desc 'Send an email to all users reminding them to select their meails'

task :selection_reminder => :environment do
  puts 'Sending the reminder...'
  SelectionReminderEmailJob.perform_later
end
