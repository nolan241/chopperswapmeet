json.array!(@pin_attachments) do |pin_attachment|
  json.extract! pin_attachment, :id, :pin_id, :pictures
  json.url pin_attachment_url(pin_attachment, format: :json)
end
