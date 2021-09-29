# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles
  has_one_attached :avatar
  has_one :cart
  after_create :initialize_cart

  validates_presence_of :name, :surname

  private

  def initialize_cart
    Cart.create(user: self)
  end
end
