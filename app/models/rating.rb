
module Rating
  def base
  	Math.sqrt(votes)
  end

  def rating_nice
  	(sprintf "%.2f", rating).to_f if rating
  end

  def is_valid?
  	(votes!=nil && rating!=nil)
  end
end
 