class VoteCategory < ActiveRecord::Base
  validates :category , presence: true
  has_many :votes
  def as_json(options={})
    {
      id: id,
      category: category
    }
  end
end
