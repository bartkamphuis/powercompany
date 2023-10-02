class Pack < ApplicationRecord
  monetize :price_subunits, as: "price"
end
