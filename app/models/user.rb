# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :cart
  has_many :orders
  after_create :initialize_cart

  validates_presence_of :name, :surname

  private

  def initialize_cart
    Cart.create(user: self)
  end
end
