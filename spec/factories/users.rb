FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'000aaa'}
    password_confirmation {password}
    last_name             {'あ亜'}
    first_name            {'あ亜'}
    last_name_kana        {'カナ'}
    first_name_kana       {'カナ'}
    birth_date            {'1930-01-01'}
  end
end