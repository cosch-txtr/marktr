class AndroidRating < ActiveRecord::Base
  belongs_to :app

  include Rating
end
