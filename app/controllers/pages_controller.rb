class PagesController < ApplicationController


  def index

    @folder = ENV['SAVE_FOLDER']

    @imap = Net::IMAP.new('imap.gmail.com', 993, usessl = true, certs = nil, verify = false)
    @imap.login(ENV['IMAP_LOGIN'], ENV['IMAP_PASSWORD'])
    @messages_count = @imap.status('Facturation', ['MESSAGES'])['MESSAGES']
    puts "Seeing #{@messages_count} messages in INBOX"

    @imap.select('Facturation')

  end

end
