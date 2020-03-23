require 'rails_helper'

RSpec.describe AdminMailer, type: :mailer do
  describe 'Admin gets selection notification' do
    
    let(:user) { create(:user) }
    
    let(:admin) { create(:user, admin: true) }

    let(:selection) do
      list_meals = create_list(:meal, 5, user: admin)
      Selection.create(user: user, month: 'march', meals: list_meals)
    end

    let(:mail) { AdminMailer.with(selection: selection, url: url_for(selection)).selection_completed }

    it 'send to the admin' do
      expect(mail.to).to eq([admin.email])
    end

    it 'it sends the selection url' do
      expect(mail.body.encoded).to match('selection')
    end
  end
end
