class User < ActiveRecord::Base
  has_many(:chirps)
  def to_s
  end

end
