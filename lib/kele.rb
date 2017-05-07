require 'httparty'

class Kele
    include HTTParty
    
    def initialize(email, password)
        @base_uri = 'https://www.bloc.io/api/v1'
        
        response = self.class.post(
            "#{@base_uri}/sessions", body: { email: email, password: password }
        )
        
        if response && response["auth_token"]
            @auth_token = response["auth_token"]
        else
            puts "Login invalid"
        end
    end
   
end