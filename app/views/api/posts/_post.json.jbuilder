json.extract! post, :id, :title, :description, :author_id
if post.photos.attached? 
  # json.photo url_for(post.photos[0]) # json.anything makes a key // .photos is calling the association
  photos_urls = post.photos.map do |photo| 
    url_for(photo)
  end
  json.photos photos_urls
end 

if current_user
  json.liked current_user.likes.where(likeable_id: post.id, likeable_type: "Post")
    .count > 0
end

json.likes post.likes.count 

# {id: "", title: "", description: "" photos: []}