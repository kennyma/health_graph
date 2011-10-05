module HealthGraph
  class User
    include API
    
    def initialize(access_token)            
      self.access_token = access_token
      @body = get "user", HealthGraph.accept_headers[:user]
    end
    
    def body
      @body
    end
             
    def userId
      @body['userID']
    end           
  end
end