class Document < ApplicationRecord
    belongs_to :topic, optional: true
end
