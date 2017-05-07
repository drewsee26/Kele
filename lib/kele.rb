require 'httparty'
require 'json'

class Kele
    include HTTParty
    include JSON
    
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
    
    def get_me
        response = self.class.get(
            "#{@base_uri}/users/me", headers: { "authorization" => @auth_token }
        )
        
        parsed_response = JSON.parse(response.body)
    end        
end