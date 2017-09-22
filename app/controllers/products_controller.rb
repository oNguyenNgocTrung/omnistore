class ProductsController < ApplicationController
  before_action :handle_user_not_has_any_shop

  def index
    @q = current_shop.products.ransack(params[:q])
    @products = @q.result.includes(:category).page(params[:page])
      .per(Settings.pagination.products)
    @view_mode = params[:view_mode] || "list"

    respond_to do |format|
      format.html do
        @product_form = Support::ProductForm.new current_shop
      end
      format.js {render layout: false}
    end
  end
end
