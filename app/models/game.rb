class Game < ActiveRecord::Base

  GENRES = ['Action', 'Adventure', 'RPG', 'Simulation', 'Strategy', 'Sports', 'FPS', 'Novel', 'Others']
  PLATFORMS = ['3DS', 'WII U', 'NX', 'PC', 'Playstation', 'XBOX', 'PS Vita', 'Mobile', 'Others']
  PROGRESS = [0, 25, 50, 75, 100, 200]

  validates :title, presence: true, :uniqueness => true
  # validates :platform, presence: true

  ratyrate_rateable "rating"


end
