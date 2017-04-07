module Blim

  TYPES = [
    Blim::ImageType.new('Full Shot', '01'),
    Blim::ImageType.new('3/4 Shot', '02'),
    Blim::ImageType.new('Clos Up', '03'),
    Blim::ImageType.new('Front', 'front'),
    Blim::ImageType.new('Back', 'back'),
    Blim::ImageType.new('Reversible Front', 'reversiblefront')
  ].freeze

end
