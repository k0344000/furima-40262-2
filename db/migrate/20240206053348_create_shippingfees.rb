class CreateShippingfees < ActiveRecord::Migration[7.0]
  def change
    create_table :shippingfees do |t|

      t.timestamps
    end
  end
end
