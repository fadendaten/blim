Collection.class_eval do

  def path_name
    prefix = "#{season}_#{year[-2,2]}_nile"
    prefix += (men? ? "_men" : "")
  end

end
