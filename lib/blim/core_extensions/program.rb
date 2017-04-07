Rails.configuration.to_prepare do
  Program.class_eval do
    def path_name
      short_name.downcase.strip
    end

    def short_name
      name.gsub(/\d*\/\d*(\ )*(N|n)(I|i)(L|l)(E|e)(\ )*/, "")
    end
  end
end
