class UserMailerPreview < ActionMailer::Preview
  def welcome
    UserMailer.with(to: "igarashi@example.com", name: "igaigarspec").welcome
  end
end
