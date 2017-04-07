module Blim
  class Colour

    attr_accessor :colour

    def initialize(colour)
      if colour.nil?
        raise ArgumentError, "Colour must be present"
      end
      @colour = colour
      @program = colour.parent
      @collection = @program.collection
    end

    def self.image_path(colour)
      new(colour).image_path
    end

    def self.exists?(colour)
      new(colour).exists?
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
      location = "#{Blim.colour_base_url}"
      location << '/'
      location << "#{@collection.path_name}"
      location << '/'
      location << "#{@program.path_name}"
      location << '/'
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
