module Blim
  class ImageType
    attr_reader :name, :identifier

    def initialize name, identifier
      @name = name
      @identifier = identifier
    end
  end
end
