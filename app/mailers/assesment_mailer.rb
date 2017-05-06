class AssesmentMailer < ApplicationMailer
  default :from => "competentu@outlook.com"

  def send_assesment(user_email,link)
    @user_email = user_email
    @link  = link
    mail(:to => user_email, :subject => "Your CompetentU Assesment Report")
  end
end
