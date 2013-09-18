class ItunesRating < ActiveRecord::Base
  belongs_to :app

  include Rating
end
