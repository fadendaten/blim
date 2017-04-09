module Blim
  class Colour

    attr_accessor :colour, :program, :collection, :men

    def initialize(colour, program, collection, men = false)
      if colour.nil?
        raise ArgumentError, "Colour must be present"
      end
      if program.nil?
        raise ArgumentError, "Program  must be present"
      end
      if collection.nil?
        raise ArgumentError, "Collection must be present"
      end
      @colour = colour
      @program = program
      @collection = collection
      @men = men
    end

    def self.image_path(colour, program, collection, men)
      new(colour, program, collection, men).image_path
    end

    def self.exists?(colour, program, collection, men)
      new(colour, program, collection, men).exists?
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
      location = "#{Blim::COLOUR_BASE_URL}"
      location << '/'
      location << "#{Blim.collection_path(@collection, @men)}"
      location << '/'
      location << "#{Blim.program_path(@program)}"
      location << '/'
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
