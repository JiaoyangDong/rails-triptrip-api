json.headers @headers
# json.headers do
#   json["X-USER-TOKEN"], @token
# end
json.user do
  json.id @user.id
  json.name @user.name
  json.image @user.image
end

json.tags do
  json.child! do
    json.name ''
    json.show 'All'
    json.icon '/images/tags/all.png'
    json.style 'height:70rpx;width:70rpx;margin-top:11rpx;'
    json.indexactive true
  end
end

json.partial! 'api/v1/trips/tags', { tags: @tags }

# json.tags do
#   json.array! @tags do |tag|
#     json.extract! tag, :id, :name, :show, :active, :style, :icon, :indexactive
#   end
# end
#   user, :id, :name, :image
#   json.partial! 'api/v1/users/user', { user: @user }
# end
