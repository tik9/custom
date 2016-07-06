#!/usr/bin/env ruby

# Beispiel:
#   cloudapp drunk-blake.png
#
# ~/.cloudapp mit:
#   email
#   password

require 'rubygems'
begin
  require 'cloudapp_api'
rescue LoadError
  puts "Installieren der cloudapp_api: gem install cloudapp_api"
  exit!(1)
end

config_file = "#{ENV['HOME']}/.cloudapp"
unless File.exist?(config_file)
  puts "email und passwort (in 2 Zeilen) in "+
       "`~/.cloudapp` eingeben"
  exit!(1)
end

email,password = File.read(config_file).split("\n")

class HTTParty::Response
  # Apparently HTTPOK.ok? IS NOT OKAY WTFFFFFFFFFFUUUUUUUUUUUUUU
  # LETS MONKEY PATCH IT I FEEL OKAY ABOUT IT
  def ok? ; true end
end

if ARGV[0].nil?
   puts "Datei!"
   exit!(1)
end

CloudApp.authenticate(email,password)
url = CloudApp::Item.create(:upload, {:file => ARGV[0]}).url

# Say it for good measure.
puts "Hochgeladen nach #{url}."

# Get the embed link.
url = "#{url}/#{ARGV[0].split('/').last}"

# Copy it to your clipboard.
#`echo '#{url}' | xclip -sel clip`
