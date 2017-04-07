module Blim
  class Style

    attr_accessor :style, :color, :type

    def initialize(style, colour, type)
      if style.nil?
        raise ArgumentError, "Style must be present"
      end
      if colour.nil?
        raise ArgumentError, "Colour  must be present"
      end
      if type.nil?
        raise ArgumentError, "Colour  must be present"
      end

      @style = style
      @colour = colour
      @type = type
      @collection = style.collection
    end

    def self.image_path(style, colour, type)
      new(style, colour, type).image_path
    end

    def self.exists?(style, colour, type)
      new(style, colour, type).exists?
    end

    def image_path
      url
    end

    def exists?
      begin
        url = URI.parse(uri)
        Net::HTTP.start(url.host, url.port, :use_ssl => url.scheme == 'https') do |http|
          return http.head(url.request_uri).code == "200"
        end
      rescue
        false
      end
    end

    private

    def url
      location = "#{Blim.style_base_url}"
      location << '/'
      location << "#{@collection.path_name}"
      location << '/'
      location << "#{@style.path_name}"
      location << '_'
      location << "#{@type.identifier}"
      location << '_'
      location << "#{@colour.path_name}"
      location << '.'
      location << "#{Blim.image_type}"
      location
    end

    def uri
      URI.encode(url.strip)
    end

  end
end
