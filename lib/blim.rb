require 'uri'
require 'net/http'

require_relative 'blim/version'
require_relative 'blim/image_type'
require_relative 'blim/types'
require_relative 'blim/style'
require_relative 'blim/colour'


module Blim

  PREFIX = 'nile'.freeze
  STYLE_BASE_URL = 'https://d1csr3q4rjsmej.cloudfront.net'.freeze
  COLOUR_BASE_URL = 'https://d2t93hgs2uwaga.cloudfront.net'.freeze
  IMAGE_TYPE = 'jpg'.freeze

  module_function

    def collection_path(collection, men)
      path = collection.gsub(/\//, '_').strip
      path << '_'
      path << "#{Blim::PREFIX}"
      if men
        path << '_men'
      end
      path
    end

    def program_path(program)
      program.downcase.strip
    end

    def style_path(style)
      path = "#{Blim::PREFIX}"
      path << '_'
      path << "#{style.upcase.strip}"
      path
    end

    def colour_path(colour)
      colour.downcase.strip
    end
end
