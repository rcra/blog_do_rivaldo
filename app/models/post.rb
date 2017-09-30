class Post < ApplicationRecord

  #Validação do paranoia
  acts_as_paranoid

  #Validação do formulário
  has_many :comments, dependent: :destroy
  validates :title, presence: true
  validates :author, presence: true
  validates :body, presence: true
  #Validação do paperclip
  has_attached_file :image, styles: { medium: "600x300>", thumb: "200x100>" }, default_url: "/assets/missing.svg"
  validates_attachment :image, content_type: { content_type: /\Aimage\/.*\Z/ }

end
