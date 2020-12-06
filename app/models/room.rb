class Room < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  validates :image                   , presence: true
  validates :title                   , presence: true
  validates :text                    , presence: true
  validates :price                   , presence: true
  validates :date_time               , presence: true
  validates :deadline_date_time      , presence: true
  validates :place                   , presence: true
  validates :category_id, numericality: { other_than: 1 }
end
