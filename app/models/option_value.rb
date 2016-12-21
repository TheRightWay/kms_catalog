class OptionValue < ActiveRecord::Base
  belongs_to :option_type
  belongs_to :variant

  delegate :tag, to: :option_type
  delegate :name, to: :option_type
end
