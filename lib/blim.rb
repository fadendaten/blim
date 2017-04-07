require 'uri'
require 'net/http'

require_relative 'blim/version'

require_relative 'blim/core_extensions/collection'
require_relative 'blim/core_extensions/program'
require_relative 'blim/core_extensions/style'
require_relative 'blim/core_extensions/colour'

require_relative 'blim/image_type'
require_relative 'blim/types'
require_relative 'blim/style'
require_relative 'blim/colour'


module Blim

  module_function

  def image_type
    'jpg'
  end

  def style_base_url
    'https://d1csr3q4rjsmej.cloudfront.net'
  end

  def colour_base_url
    'https://d2t93hgs2uwaga.cloudfront.net'
  end

end
