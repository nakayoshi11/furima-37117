class ItemAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building_name, :telephone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :telephone_number, format: {with: /\A\d{10,11}\z/, message: "Half-width numerical value only"}

    validates :city,:address, :token, :user_id, :item_id

end
validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
validates :telephone_number, length: { minimum: 10, message: 'is too short' }
validates :telephone_number, length: { maximum: 11, message: 'is too long' }

def save
  purchase_history = PurchaseHistory.create(user_id: user_id, item_id: item_id)
  Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, telephone_number: telephone_number, purchase_history_id: purchase_history.id)
end
end