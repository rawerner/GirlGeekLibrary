# require 'carrierwave/test/matchers'
require 'spec_helper'
require 'carrierwave'
require 'factories'
require_relative '../../app/uploaders/photo_uploader'


describe PhotoUploader do
  include CarrierWave::Test::Matchers

  before do
    PhotoUploader.enable_processing = true
    @user = create(:user, photo: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/images/thumb_rachel_werner.jpg'))))
    @uploader = PhotoUploader.new(@user, :photo)
    @uploader.store!(File.open("spec/images/thumb_rachel_werner.jpg"))
  end

  after do
    PhotoUploader.enable_processing = false
    @uploader.remove!
  end

  context 'the thumb version' do
    it "should scale down a landscape image to be exactly 50 by 50 pixels" do
      @uploader.thumb.should have_dimensions(50, 50)
    end
  end

end

