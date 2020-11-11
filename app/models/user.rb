class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  has_many :sns_credentials

  validates :nickname,  presence: true,uniqueness:  { case_sensitive: true }
  validates :full_name, presence: true
  validates :full_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力してください'}
  validates :gender_id, numericality: { other_than: 1, message: 'を選んでください' } 
  validates :phone_number, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'は半角数字含めて作成してください'}


  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
     # sns認証したことがあればアソシエーションで取得
     # 無ければemailでユーザー検索して取得orビルド(保存はしない)
   user = User.where(email: auth.info.email).first_or_initialize(
    nickname: auth.info.name,
      email: auth.info.email
  )
     # userが登録済みであるか判断
     if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
end
