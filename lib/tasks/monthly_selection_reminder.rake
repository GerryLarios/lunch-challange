desc 'Send an email to all users reminding them to select their meails'

task :selection_reminder => :environment do
  puts 'Sending the reminder...'
  User.find_each do |user|
    puts "to #{user.email}"
    UserMailer.with(user: user).selection_reminder.deliver
  end
end
