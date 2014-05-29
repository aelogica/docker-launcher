class InstanceNotificationsMailer < ActionMailer::Base
  def instance_creation(email, ssh, http)
    @ssh = ssh
    @http = http

    mail(subject: 'Your app is ready', to: email)
  end
end
