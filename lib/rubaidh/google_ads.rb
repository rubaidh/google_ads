module Rubaidh
  module GoogleAds
    mattr_accessor :defaults
    @@defaults = {
      :client   => 'pub-invalid-client',
      :width    => 200,
      :height   => 200,
      :ad_slot  => 'invalid_ad_slot'
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