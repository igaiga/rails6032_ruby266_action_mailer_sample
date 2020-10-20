require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "UserMailer welcomeメソッド" do
    it "メールが送信キューに追加されること" do
      expect {
        perform_enqueued_jobs do
          UserMailer.with(to: "igarashi@example.com", name: "igaiga").welcome.deliver_now
        end
      }.to change { ActionMailer::Base.deliveries.size }.by(1)
    end

    it "送信されるメール情報が意図通りであること" do
      UserMailer.with(to: "igarashi@example.com", name: "igaiga").welcome.deliver_now
      email = ActionMailer::Base.deliveries.last
      expect(email.to).to eq ["igarashi@example.com"]
      expect(email.from).to eq ["from@example.com"]
      expect(email.subject).to eq "登録完了"
      expect(email.text_part.decoded).to include "igaiga"
      expect(email.html_part.decoded).to include "igaiga"
    end
  end
end
