json.headers @headers
# json.headers do
#   json["X-USER-TOKEN"], @token
# end
json.user do
  json.id @user.id
  json.name @user.name
  json.image @user.image
end
#   user, :id, :name, :image
#   json.partial! 'api/v1/users/user', { user: @user }
# end
