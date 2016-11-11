class CreatePaymentTerms < ActiveRecord::Migration
  def change
    create_table :payment_terms do |t|
      t.string :content

      t.timestamps null: false
    end
  end
end
