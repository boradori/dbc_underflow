require 'httparty'

module ApplicationHelper
include HTTParty

  def self.get_quote
    options = {
          basic_auth: {
            username: ENV['ACCESS_TOKEN'],
            password: "x-oauth-basic"
          },
          headers: {
            "User-Agent" => "DBC Underflow",
            "Content-Type" => "application/json"
          }
        }
    url = 'https://api.github.com/zen'
    response = HTTParty.get(url, options )
    p response.code
    if response.code == 200
      return response.body
    else
      return "I am my code."
    end
  end

end

# options = {
#           # basic_auth: {
#           #   username: ENV['ACCESS_TOKEN'],
#           #   password: "x-oauth-basic"
#           # },
#           headers: {
#             "Authorization" => "token #{token}",
#             "User-Agent" => "#{user}",
#             "Content-Type" => "application/json"
#           }
#         }
