class VoteCategory < ActiveRecord::Base
  validates :category , presence: true
  def as_json(options={})
    {
      id: id,
      category: category
    }
  end
end
