module Kms
  class OptionType < ActiveRecord::Base
    has_many :product_option_types, dependent: :destroy
    has_many :products, through: :product_option_types

    has_many :option_values, dependent: :destroy
    has_many :variants, through: :option_values



  end
end
