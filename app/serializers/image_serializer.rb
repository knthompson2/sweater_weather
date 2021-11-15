class ImageSerializer
  include JSONAPI::Serializer

  set_id :id
  set_type :image

  attributes :description, :image_url, :photographer_name, :photographer_url, :source

end
