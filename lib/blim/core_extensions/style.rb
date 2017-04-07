Rails.configuration.to_prepare do
  Style.class_eval do

    def path_name
      "nile_#{number.upcase.strip}"
    end
  end
end
