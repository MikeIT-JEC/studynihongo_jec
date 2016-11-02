ActionMailer::Base.smtp_settings = {
    :address => "smtp.gmail.com",
    :port => 587,
    :domain => "mail.gmail.com",
    :user_name => "mike.jec.it@gmail.com",
    :password => "jecit802",
    :authentication => :plain
}