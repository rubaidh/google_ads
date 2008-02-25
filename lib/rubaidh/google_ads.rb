module Rubaidh
  module GoogleAds
    mattr_accessor :defaults
    @@defaults = {
      :client         => 'pub-invalid-client',
      :width          => 200,
      :height         => 200,
      :type           => :text_image,
      :channel        => nil,
      :border_colour  => 'FFFFFF',
      :bg_colour      => 'FFFFFF',
      :link_colour    => '0000FF',
      :text_colour    => '000000',
      :url_colour     => '00FF00',
      :ui_features    => 'rc:0'
    }
    
    mattr_accessor :ad_formats
    @@ad_formats = {
      :default => {}
    }
    
    mattr_accessor :environments
    @@environments = ['production']
    
    def self.enabled?
      environments.include?(RAILS_ENV)
    end
  end
end