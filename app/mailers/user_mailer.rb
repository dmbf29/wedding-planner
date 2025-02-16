class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.rsvp.subject
  #
  def rsvp
    @person = params[:person]
    @group = @person.group
    @events = @person.events
    mail(to: @person.email, subject: "Doug & Hyelim's Wedding RSVP")
  end
end
