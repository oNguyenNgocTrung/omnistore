class Support::Base
  def initialize shop
    @shop = shop
  end

  private
  attr_reader :shop
end
