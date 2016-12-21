module Kms
  class Property < ActiveRecord::Base
    include Liquor::Dropable
    belongs_to :product
  end
end
