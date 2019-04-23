module OptionsHelper

  def random_option(category)
    category.options.pluck(:id).sample

  end

  def actual_option(category)
    category.options.pluck(:id)
  end

end
