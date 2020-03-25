class SelectionReminderEmailService
  def send
    User.find_each do |user|
      mail = UserMailer.with(user: user).selection_reminder.deliver_later if !has_next_selection?(user)
      puts mail.to if mail
    end
  end

  private

  def has_next_selection?(user)
    selection = Selection.find_by(user: user)
    (selection&.month == next_month)
  end

  def next_month
    Date.today.next_month.strftime('%B').downcase
  end
end
