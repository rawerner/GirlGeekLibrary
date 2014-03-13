if Rails.env.test? or Rails.env.cucumber? or Rails.env.development?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end
else
  CarrierWave.configure do |config|
    config.storage = :fog
    config.fog_credentials = {
      :provider              => 'AWS',
      :aws_access_key_id     => 'AWS_ACCESS_KEY',
      :aws_secret_access_key => 'AWS_SECRET_ACCESS_KEY',
    }
    config.fog_directory = 'uploads'
    config.fog_public    = false
  end
end