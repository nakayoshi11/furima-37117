class ItemAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building_name, :telephone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
 
    validates :postal_code, :city,:address, :telephone_number, presence: true

end
validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

def save
  purchase_history = PurchaseHistory.create(user_id: user_id, item_id: item_id)
  Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, telephone_number: telephone_number, purchase_history_id: purchase_history.id)
end
end