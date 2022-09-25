class PagesController < ApplicationController


  def index

    imap = Net::IMAP.new('imap.gmail.com', 993, usessl = true, certs = nil, verify = false)
    imap.login(ENV["IMAP_LOGIN"], ENV["IMAP_PASSWORD"])
    @messages_count = imap.status('INBOX', ['MESSAGES'])['MESSAGES']
    puts "Seeing #{@messages_count} messages in INBOX"

  end

end
