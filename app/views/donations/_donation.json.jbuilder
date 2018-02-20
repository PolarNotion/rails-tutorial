json.extract! donation, :id, :amount_in_cents, :donor_name, :stripe_charge_id, :donor_email, :created_at, :updated_at
json.url donation_url(donation, format: :json)
