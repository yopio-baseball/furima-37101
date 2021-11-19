class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  # has_many :orders

  validates :nickname, presence:true
  validates :day_of_birth, presence:true 

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角(漢字・ひらがな・カタカナ)を使用してください' } do
    validates :last_name , presence:true
    validates :first_name, presence:true 

  end

  with_options presence: true, format: { with: /\A[ァ-ヶ一ー]+\z/, message: '全角カタカナを使用してください' } do
    validates :last_name_kana, presence:true 
    validates :first_name_kana, presence:true
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' do
  
  end
end
