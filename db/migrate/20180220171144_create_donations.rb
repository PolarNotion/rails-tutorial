class CreateDonations < ActiveRecord::Migration[5.1]
  def change
    create_table :donations do |t|
      t.integer :amount_in_cents
      t.string  :donor_name
      t.string  :stripe_charge_id
      t.string  :donor_email

      t.timestamps
    end
  end
end
