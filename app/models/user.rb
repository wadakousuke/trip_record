class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts,dependent: :destroy
  has_many :post_comments, dependent: :destroy
  scope :only_active, -> { where(is_active: true) }
   def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
      user.last_name = "さん"
      user.first_name = "ゲスト"
      user.last_name_kana = ""
      user.first_name_kana = ""
    end
   end


end
