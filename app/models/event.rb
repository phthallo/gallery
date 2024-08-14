class Event < ApplicationRecord
    has_many_attached :images do |image|
        image.variant :preview, saver: { quality: 60 },  preprocessed: true
    end
end
