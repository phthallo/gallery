require 'httparty'
class SessionsController < ApplicationController
  def index
  end
  def oauth_callback
    authorization_code = params[:code]
    state = params[:state]
    puts authorization_code
    response = HTTParty.post('https://slack.com/api/oauth.v2.access', 
      body: {
        client_id: ENV['CLIENT_ID'],
        client_secret: ENV['CLIENT_SECRET'],
        code: authorization_code,
        redirect_uri: ENV['REDIRECT_URI']
      }
    )
    if response.success?
      data = response.parsed_response
      access_token = data['access_token']
      redirect_to "/"
    else
      # Handle the error case
      render plain: "Error obtaining access token", status: :unprocessable_entity
    end
  end
end
