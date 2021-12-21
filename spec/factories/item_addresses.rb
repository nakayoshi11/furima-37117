FactoryBot.define do
  factory :item_address do
    
    postal_code                   {'123-1234'}
    prefecture_id                 {2}
    city                          {'漢字'}
    address                       {'漢字123-1'}
    telephone_number              {11111111111}
    token                         {"tok_84da553fcd53a1b4eafa65fdffd3"}
    building_name                 {"漢字111-111"}
  end
end
