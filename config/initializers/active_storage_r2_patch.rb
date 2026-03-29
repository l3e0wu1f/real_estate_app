# Disable checksum headers for Cloudflare R2 (Rails 8 compatible)
Rails.application.config.to_prepare do
  Aws::S3::Client.prepend(Module.new do
    def put_object(params = {}, options = {})
      # Cloudflare R2 rejects multiple checksum headers.
      params.delete(:checksum_algorithm)
      params.delete(:content_md5)
      super(params, options)
    end
  end)
end