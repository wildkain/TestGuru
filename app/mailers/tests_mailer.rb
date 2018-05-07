class TestsMailer < ApplicationMailer
  default from: %{"TestGuru", <mail@testguru.com>}
  layout 'mailer'

  def completed_test(test_passage)
    @user = test_passage.user
    @test = test_passage.test

    mail to: @user.email
  end

end
