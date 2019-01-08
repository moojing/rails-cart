require "shrine"
require "shrine/storage/file_system"

Shrine.storages = {
  cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"), # temporary
  store: Shrine::Storage::FileSystem.new("public", prefix: "uploads"),       # permanent
}

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data # for retaining the cached file across form redisplays
Shrine.plugin :restore_cached_data # re-extract metadata when attaching a cached file
Shrine.plugin :rack_file # for non-Rails apps



# if Rails.env.production?
#   Shrine.plugin :presign_endpoint, presign_options: -> (request) {
#     # Uppy will send the "filename" and "type" query parameters
#     filename = request.params["filename"]
#     type     = request.params["type"]

#     {
#       content_disposition:    "inline; filename=\"#{filename}\"", # set download filename
#       content_type:           type,                               # set content type (defaults to "application/octet-stream")
#       content_length_range:   0..(10*1024*1024),                  # limit upload size to 10 MB
#     }
#   }
# else
#   Shrine.plugin :upload_endpoint
# end