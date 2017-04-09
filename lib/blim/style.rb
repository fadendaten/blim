module Blim
  class Style

    attr_accessor :style, :colour, :collection, :type, :men

    def initialize(style, colour, collection, type, men = false)
      if style.nil?
        raise ArgumentError, "Style number must be present"
      end
      if colour.nil?
        raise ArgumentError, "Colour name must be present"
      end
      if collection.nil?
        raise ArgumentError, "Collection name  must be present"
      end
      if type.nil?
        raise ArgumentError, "Type must be present"
      end

      @style = style
      @colour = colour
      @collection = collection
      @type = type
      @men = men
    end

    def self.image_path(style, colour, collection, type, men)
      new(style, colour, collection, type, men).image_path
    end

    def self.exists?(style, colour, collection, type, men)
      new(style, colour, collection, type, men).exists?
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
      location = "#{Blim::STYLE_BASE_URL}"
      location << '/'
      location << "#{Blim.collection_path(@collection, @men)}"
      location << '/'
      location << "#{Blim.style_path(@style)}"
      location << '_'
      location << "#{@type.identifier}"
      location << '_'
      location << "#{Blim.colour_path(@colour)}"
      location << '.'
      location << "#{Blim::IMAGE_TYPE}"
      location
    end

    def uri
      URI.encode(url.strip)
    end

  end
end
