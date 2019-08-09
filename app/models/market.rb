class Market < ApplicationRecord
    validates_uniqueness_of :title
end
