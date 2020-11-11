FactoryBot.define do
  factory :user do
    nickname              {"abe"}
		email                 {"kkk@gmail.com"}
		password              {"a00000"}
		password_confirmation {password}
		full_name             {"山田太郎"}
		full_name_kana        {"ヤマダタロウ"}
		gender_id             {2}
		phone_number          {00000000000}
  end
end
