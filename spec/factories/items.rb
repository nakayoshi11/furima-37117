FactoryBot.define do
  factory :item do
    association :user

    product_name                  {'test'}
    product_description           {'test'}
    product_category_id           {2}
    product_condition_id          {2}
    burden_of_shipping_charge_id  {2}
    prefecture_id                 {2}
    days_to_ship_id               {2}
    selling_price                 {500}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
