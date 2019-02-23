FactoryGirl.define do
  factory :fund_source do
    extra 'bitcoin'
    uid { Faker::Bitcoin.address }
    is_locked false
    currency 'btc'

    member { create(:member) }

    trait :brl do
      extra 'bc'
      uid '123412341234'
      currency 'brl'
    end

    factory :brl_fund_source, traits: [:brl]
    factory :btc_fund_source
  end
end

