module HealthGraph
  module Authentication
    def authorize_url 
      client.auth_code.authorize_url :redirect_uri => authorization_redirect_url
    end
    
    def access_token(code)
      client.auth_code.get_token(code, :redirect_uri => authorization_redirect_url).token
    end
    
    def client 
      OAuth2::Client.new client_id, client_secret, {:authorize_url => authorization_url, :token_url => access_token_url}
    end   
  end
end