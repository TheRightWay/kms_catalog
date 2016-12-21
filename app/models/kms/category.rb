module Kms
  class Category < ActiveRecord::Base
    include Liquor::Dropable
    extend FriendlyId
    include Kms::Permalinkable
    include Kms::CompileTemplates
    has_and_belongs_to_many :products
    has_ancestry
    friendly_id :name, use: :slugged
    before_create :set_position

    mount_uploader :logo, CategoryLogoUploader

    def set_position
      if parent.present?
        max = parent.children.maximum(:position)
      else
        max = Category.where('ancestry IS ?', nil).maximum(:position)
      end
      self.position = max ? max + 1 : 0
    end
  end
end
