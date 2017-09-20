require 'slack-notifier'
require 'active_support/core_ext/integer/inflections'

module SlackModule
  class API
    # Launch Subscribers
    def self.notify_user_registered(email, total)
      msg = "*User Registered* (#{total} total)\n"
      msg << "\tEmail: #{email}\n"
      self.notify msg
    end

    def self.notify(message, attachments=nil)
      return if Rails.env.test?
      slack = Slack::Notifier.new(
        Rails.application.secrets[:slack][:webhook_url],
        channel: '#general',
        username: "quillup-#{Rails.env}"
      )
      if attachments
        slack.ping message, attachments: attachments
      else
        slack.ping message
      end
    end
  end
end
