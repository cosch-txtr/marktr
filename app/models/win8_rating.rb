class Win8Rating < ActiveRecord::Base
  belongs_to :app

  include Rating
end
