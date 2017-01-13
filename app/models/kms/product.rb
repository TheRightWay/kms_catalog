module Kms
  class Product < ActiveRecord::Base
    include Liquor::Dropable
    extend FriendlyId
    include Kms::Permalinkable
    include Kms::CompileTemplates
    has_and_belongs_to_many :categories
    has_many :properties, dependent: :destroy

    has_many :product_option_types, dependent: :destroy
    has_many :option_types, through: :product_option_types

    has_many :variants,
      -> { where(type: Kms::Variant.name) },
      class_name: 'Kms::Variant', dependent: :destroy

    has_one :master, class_name: 'Kms::MasterVariant', dependent: :destroy

    friendly_id :name, use: :slugged

    # mount_uploader :image, ProductImageUploader
    # mount_uploader :preview_image, ProductImageUploader

    accepts_nested_attributes_for :master

    after_initialize :init_master

    protected

    def init_master
      return unless new_record?
      self.master ||= build_master
    end
  end
end
