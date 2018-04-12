CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: 'AKIAIEKJ3DTWCSZ7VBBQ',
    aws_secret_access_key: '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',
    region: 'ap-northeast-1'
  }

  config.fog_directory  = 'rails-photo-teamc'
  config.cache_storage = :fog
end
