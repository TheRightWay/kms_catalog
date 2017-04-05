module Kms
  class Category < ActiveRecord::Base
    include Liquor::Dropable
    extend FriendlyId
    include Kms::Permalinkable
    include Kms::CompileTemplates
    include Kms::Positioned
    has_and_belongs_to_many :products
    has_ancestry
    friendly_id :name, use: :slugged

    mount_uploader :logo, CategoryLogoUploader

  end
end
