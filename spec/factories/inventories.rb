FactoryGirl.define do
   factory :inventory do
     purchaser_name "Snake Plissken"
     item_description "$20 Sneakers for $5"
     item_price 10.0
     purchase_count 7
     merchant_address "123 Fake St	Sneaker"
     merchant_name "Store Emporium"
   end
 end