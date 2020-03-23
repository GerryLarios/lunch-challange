require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  describe 'User gets reminder about select meals' do
    let(:user) { create(:user) }    
    let(:mail) { UserMailer.with(user: user).selection_reminder }
    
    it 'renders the headers' do
      expect(mail.to).to eq([user.email])
    end

    it 'send the selection url' do
      expect(mail.body.encoded).to match('selection')
    end
  end
end
