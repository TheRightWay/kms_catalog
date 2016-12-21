class CreateOptionTypes < ActiveRecord::Migration
  def change
    create_table :kms_option_types do |t|
      t.string :tag
      t.string :name

      t.timestamps null: false
    end
  end
end
