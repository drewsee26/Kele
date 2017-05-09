require 'httparty'
require 'json'
require 'roadmap'

class Kele
    include HTTParty
    include JSON
    include Roadmap
    
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
        
        return parsed_response
    end  
    
    def get_mentor_availability(mentor_id)
        @mentor_id = 539470
        
        response = self.class.get(
            "#{@base_uri}/mentors/#{@mentor_id}/student_availability", headers: { "authorization" => @auth_token }, body: { id: mentor_id }
        )
        
        schedule_array = JSON.parse(response.body)
        
        return schedule_array
    end
end