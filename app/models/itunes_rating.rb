class ItunesRating < ActiveRecord::Base
  belongs_to :app

  def base
  	votes
  end

  def rating_nice
  	(sprintf "%.2f", rating).to_f
  end
end
