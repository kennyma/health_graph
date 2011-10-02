module HealthGraph
  class User
    include API
    
    def initialize(access_token)            
      self.access_token = access_token
      body = get "user", accept_headers[:user]
    end                
  end
end