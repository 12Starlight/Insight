@comments.each do |comment|
  json.comments do 
    json.set! comment.id do 
      json.partial! "comment", comment: comment 
    end
  end

  json.users do 
    json.set! comment.author.id do 
      if @user 
        json.commentIds @comments.ids 
      end 
      json.partial! "/api/users/user", user: comment.author  
  end
end 