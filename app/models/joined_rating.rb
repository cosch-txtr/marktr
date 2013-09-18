class JoinedRating < ActiveRecord::Base
  belongs_to :app

  def votes
  	android_votes + itunes_votes
  end

  def rating
  	android_rating + itunes_rating
  end

  def android_rating_nice
  	(sprintf "%.2f", android_rating).to_f
  end

  def itunes_rating_nice
  	(sprintf "%.2f", itunes_rating).to_f
  end

  include Rating
end
