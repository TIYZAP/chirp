class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :api_token, :avatar, :followers_count, :followees_count



  def avatar
    Refile.attachment_url(object, :avatar, :fit, 100, 100, format: "jpg")
  end
end
