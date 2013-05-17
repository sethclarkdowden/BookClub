class AuthController < ApplicationController

	def connect
	  # Get the token from the session if available or exchange the authorization
	  # code for a token.
	  if !session[:token]
	    # Make sure that the state we set on the client matches the state sent
	    # in the request to protect against request forgery.
	    if session[:state] == params[:state]
	      # Upgrade the code into a token object.
	      $authorization.code = request.body.read
	      $authorization.fetch_access_token!
	      $client.authorization = $authorization

	      id_token = $client.authorization.id_token
	      encoded_json_body = id_token.split('.')[1]
	      # Base64 must be a multiple of 4 characters long, trailing with '='
	      encoded_json_body += (['='] * (encoded_json_body.length % 4)).join('')
	      json_body = Base64.decode64(encoded_json_body)
	      body = JSON.parse(json_body)
	      # You can read the Google user ID in the ID token.
	      # "sub" represents the ID token subscriber which in our case
	      # is the user ID. This sample does not use the user ID.
	      gplus_id = body['sub']

	      # Serialize and store the token in the user's session.
	      token_pair = TokenPair.new
	      token_pair.update_token!($client.authorization)
	      session[:token] = token_pair
	    else
	      halt 401, 'The client state does not match the server state.'
	    end
	  end
	  status 200
	end

	def disconnect
	  halt 401, 'No stored credentials' unless session[:token]

	  # Use either the refresh or access token to revoke if present.
	  token = session[:token].to_hash[:refresh_token]
	  token = session[:token].to_hash[:access_token] unless token

	  # You could reset the state at this point, but as-is it will still stay unique
	  # to this user and we're avoiding resetting the client state.
	  # session.delete(:state)
	  session.delete(:token)

	  # Send the revocation request and return the result.
	  revokePath = 'https://accounts.google.com/o/oauth2/revoke?token=' + token
	  uri = URI.parse(revokePath)
	  request = Net::HTTP.new(uri.host, uri.port)
	  request.use_ssl = true
	  status request.get(uri.request_uri).code
	end
end
