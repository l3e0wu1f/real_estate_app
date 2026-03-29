# Patch Active Storage to disable multiple checksum headers for Cloudflare R2
Rails.application.config.to_prepare do
  ActiveStorage::Service.url_expires_in = 1.hour

  ActiveStorage::Service::S3Service.prepend(Module.new do
    def upload(key, io, checksum: nil, **options)
      # Remove all checksum headers — R2 rejects multiple checksums
      options.delete(:checksum)
      super(key, io, checksum: nil, **options)
    end
  end)
end