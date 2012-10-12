require 'factory_girl'

FactoryGirl.define do
  factory :user do |f|
    f.full_name "Duc Trinh"
    f.email "duc.trinh@eastagile.com"
    f.username "ty_edge_540t"
    f.password "password"
    f.password_confirmation "password"
  end

  trait :normal_user do
    sequence(:full_name) {|n| "full_name_#{n}"}
    sequence(:email) {|n| "full.name.#{n}@testing.com"}
    sequence(:username) {|n| "username#{n}"}
    sequence(:password) {|n| "password#{n}"}
    sequence(:password_confirmation) {|n| "password#{n}"}
  end

  trait :invalid_user do |f|
    f.email "abc"
  end
end