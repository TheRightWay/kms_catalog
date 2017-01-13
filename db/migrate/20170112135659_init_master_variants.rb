class InitMasterVariants < ActiveRecord::Migration[5.0]
  def up
    Kms::Product.find_each do |product|
      unless product.master
        product.create_master(price: product.price, name: product.name)
      end
    end
  end

  def down
    Kms::Product.find_each do |product|
      product.master&.destroy
    end
  end
end
