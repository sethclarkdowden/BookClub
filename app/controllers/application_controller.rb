class ApplicationController < ActionController::Base
  before_filter :setup_oauth2
  protect_from_forgery

def :setup_oauth2
		APPLICATION_NAME = 'Google+ Ruby Quickstart'
		PLUS_LOGIN_SCOPE = 'https://www.googleapis.com/auth/plus.login'

		# Build the global client
		$credentials = Google::APIClient::ClientSecrets.load
		$authorization = Signet::OAuth2::Client.new(
		    :authorization_uri => $credentials.authorization_uri,
		    :token_credential_uri => $credentials.token_credential_uri,
		    :client_id => $credentials.client_id,
		    :client_secret => $credentials.client_secret,
		    :redirect_uri => $credentials.redirect_uris.first,
		    :scope => PLUS_LOGIN_SCOPE)
		$client = Google::APIClient.new
  def 
end

class TokenPair
  @refresh_token
  @access_token
  @expires_in
  @issued_at

  def update_token!(object)
    @refresh_token = object.refresh_token
    @access_token = object.access_token
    @expires_in = object.expires_in
    @issued_at = object.issued_at
  end

  def to_hash
    return {
      :refresh_token => @refresh_token,
      :access_token => @access_token,
      :expires_in => @expires_in,
      :issued_at => Time.at(@issued_at)}
  end
end