class JoinedRating < ActiveRecord::Base
  belongs_to :app

  def votes
  	android_votes + itunes_votes
  end

  def rating
  	android_rating + itunes_rating
  end

  include Rating
end
