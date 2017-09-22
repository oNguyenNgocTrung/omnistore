class Product < ApplicationRecord
  include Sendchainable

  belongs_to :shop
  belongs_to :category, optional: true
  belongs_to :vendor, optional: true

  has_many :collection_products, dependent: :destroy
  has_many :product_options, dependent: :destroy
  has_many :product_tags, dependent: :destroy
  has_many :variants, dependent: :destroy
  has_many :collections, through: :collection_products
  has_many :options, through: :product_options
  has_many :tags, through: :product_tags

  enum visibility: [:publish, :unpublished]
  enum inventory: [:in_stock, :out_of_stock]

  validates :name, :shop_id, presence: true
  validates :price, :quantity, :weight, numericality: {greater_than_or_equal_to: 0}

  delegate :name, to: :category, prefix: true, allow_nil: true
  delegate :name, to: :vendor, prefix: true, allow_nil: true

  scope :by_category, ->category {where category: category}
  scope :by_vendor, ->vendor {where vendor: vendor}
  scope :by_collection, ->collection do
    where id: CollectionProduct.where(collection: collection).select(:product_id)
  end
  scope :by_tag, ->tag do
    where id: ProductTag.where(tag: tag).select(:product_id)
  end

  ransack_alias :keyword, :name_or_description_or_sku_or_barcode

  private
  def self.ransackable_scopes auth_object = nil
    %i(by_collection by_tag)
  end
end
