module OptionsHelper

  def random_option(category)
    category.options.pluck(:id).sample

  end


end
