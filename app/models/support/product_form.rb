class Support::ProductForm < Support::Base
  def categories
    @categories ||= shop.categories.pluck :name, :id
  end

  def vendors
    @vendors ||= shop.vendors.pluck :name, :id
  end

  def collections
    @collections ||= shop.collections.pluck :name, :id
  end

  def tags
    @tags ||= shop.tags.pluck :name, :id
  end
end
