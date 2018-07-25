class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { scope: :release_year }
  # validates :release_year, ({presence: true, numericality: {less_than_or_equal_to: Date.current.year}}), if: :released?
  validates :artist_name, presence: true
  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: {
      less_than_or_equal_to: Date.today.year
    }
  end

  def released?
    self.released == true
  end
end
