require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  test "rsvp" do
    mail = UserMailer.rsvp
    assert_equal "Rsvp", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
