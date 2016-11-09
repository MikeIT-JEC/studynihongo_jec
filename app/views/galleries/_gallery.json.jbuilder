json.extract! gallery, :id, :caption, :created_at, :updated_at
json.url gallery_url(gallery, format: :json)