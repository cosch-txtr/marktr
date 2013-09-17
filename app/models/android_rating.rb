class AndroidRating < ActiveRecord::Base
  belongs_to :app

  def base
  	five+four+three+two+one
  end
end
