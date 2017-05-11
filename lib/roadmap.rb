module Roadmap
    def get_roadmap(roadmap_id)
        @roadmap_id = 31
        
        response = self.class.get(
            "#{@base_uri}/roadmaps/#{@roadmap_id}", headers: { "authorization" => @auth_token }, body: { id: roadmap_id }   
        )
        
        parsed_roadmap = JSON.parse(response.body)
        
        return parsed_roadmap
    end
        
    def get_checkpoint(checkpoint_id)
        response = self.class.get(
            "#{@base_uri}/checkpoints/#{checkpoint_id}", headers: { "content_type" => 'application/json', "authorization" => @auth_token }  
        )
        
        JSON.parse(response.body)
    end
end