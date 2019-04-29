class Artwork < ApplicationRecord
    validates :title, :img_url, :artist_id, presence: true
    validates :title, uniqueness: {scope: :artist_id, message: "Can't have two artworks with same title"}

    belongs_to :artist,
        primary_key: :id,
        foreign_key: :artist_id,
        class_name: :User

    has_many :artwork_shares,
        primary_key: :id,
        foreign_key: :artword_id,
        class_name: :ArtworkShare

    has_many :shared_viewers,
        through: :artwork_shares,
        source: :viewer

end