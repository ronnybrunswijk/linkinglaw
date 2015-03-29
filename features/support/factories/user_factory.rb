
FactoryGirl.define do

  factory :user, class: User do
      name "Jack Dempsey"
      email "jack.dempsey@boxing.ko"
      password  "lefthook"
      password_confirmation "lefthook"
      confirmed_at DateTime.now
  end

end
