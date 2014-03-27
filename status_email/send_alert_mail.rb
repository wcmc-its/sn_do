require 'net/smtp'

message = <<MESSAGE_END
From: #{@from}
To: #{@recipients.join(",")}
MIME-Version: 1.0
Content-type: text/html
Subject: #{@subject}

#{@body}
MESSAGE_END

Net::SMTP.start(@smtpserver) do |smtp|
  smtp.send_message message, @from, @recipients
end
