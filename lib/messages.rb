module Messages
    def get_messages(page)    
        response = self.class.get(
            "#{@base_uri}/message_threads", 
            headers: { "authorization" => @auth_token }, body: { page: page}    
        )
    
        JSON.parse(response.body)
    end
    
    def create_message(sender, recipient_id, token, subject, body)
        
        response = self.class.post(
            "#{@base_uri}/messages", 
            headers: { "content_type" => 'application/json', "authorization" => @auth_token}, 
            body: {sender: sender, recipient_id: recipient_id, token: token, subject: subject, stripped_text: body}
        )
        
    end
end