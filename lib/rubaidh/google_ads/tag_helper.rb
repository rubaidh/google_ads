module Rubaidh
  module GoogleAds
    module TagHelper
      def self.included(base)
        base.send(:include, InstanceMethods)
      end

      module InstanceMethods
        # Spit out a google ad with the appropriate settings pulled from
        # our configuration
        def google_ad(format = :default)

          return unless GoogleAds.enabled?

          options = Rubaidh::GoogleAds.defaults.merge(Rubaidh::GoogleAds.ad_formats[format])
          js = javascript_tag <<-JS
            google_ad_client = "#{options[:client]}";
            google_ad_width = #{options[:width]};
            google_ad_height = #{options[:height]};
            google_ad_slot = "#{options[:ad_slot]}";
          JS
          js << "\n"
          js << javascript_include_tag("http://pagead2.googlesyndication.com/pagead/show_ads.js")
        end
      end
    end
  end
end