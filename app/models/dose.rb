class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail
  validates :description, presence: true
  validates :cocktail, presence: true
  validates :ingredient, presence: true
  validates_uniqueness_of :cocktail, scope: :ingredient
end

# A dose belongs to an ingredient
# A dose belongs to a cocktail

# You can't delete an ingredient if it used by at
# least one cocktail.
# When you delete a cocktail, you should delete
# associated doses (but not the ingredients as
# hey can be linked to other cocktails).


# A dose must have a description, a cocktail and an ingredient,
# and [cocktail, ingredient] pairings should be unique.
# add_index :readings, [:person_id, :article_id], unique: true
