#!/usr/bin/ruby

require 'yaml'
require 'twitter'

class TwitterClient
	def initialize()
		@keys = YAML.load_file("secret.yml")["twitter"]
		@client = Twitter::REST::Client.new do |config|
			config.consumer_key			= @keys["CONSUMER_KEY"]
			config.consumer_secret		= @keys["CONSUMER_SECRET"]
			config.access_token			= @keys["ACCESS_TOKEN"]
			config.access_token_secret	= @keys["ACCESS_TOKEN_SECRET"]
		end
	end

	def tweet(str)
		@client.update(str)
	end

	def reply(status_id, str)
		@client.update(str, in_reply_to_status_id: status_id)
	end
end
