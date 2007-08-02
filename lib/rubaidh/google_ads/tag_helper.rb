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
          options = Rubaidh::GoogleAds.defaults.merge(Rubaidh::GoogleAds.ad_formats[format])
          js = javascript_tag <<-JS
            google_ad_client = "pub-8140540546285689";
            google_ad_width = #{options[:width]};
            google_ad_height = #{options[:height]};
            google_ad_format = "#{options[:width]}x#{options[:height]}_as";
            google_ad_type = "#{options[:type]}";
            google_ad_channel = "#{options[:channel]}";
            google_color_border = "#{options[:border_colour]}";
            google_color_bg = "#{options[:bg_colour]}";
            google_color_link = "#{options[:link_colour]}";
            google_color_text = "#{options[:text_colour]}";
            google_color_url = "#{options[:url_colour]}";
            google_ui_features = "#{options[:ui_features]}";
          JS
          js << "\n"
          js << javascript_include_tag("http://pagead2.googlesyndication.com/pagead/show_ads.js")
        end
      end
    end
  end
end