Rails.configuration.to_prepare do
  Colour.class_eval do
    def path_name
      name.downcase.strip
    end
  end
end
