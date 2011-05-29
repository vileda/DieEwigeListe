class Player < ActiveRecord::Base
  has_many :fixtures
  has_many :matches, :through => :fixtures
  belongs_to :user
  has_attached_file :avatar, :styles => {:medium => "300x300>", :thumb => "100x100>", :mini => "75x75>"}, :path => ":rails_root/public/system/:attachment/:id/:style/:filename"

  validates_presence_of :name

  # @return [Array]
  def self.ladder
    players = Player.all
    players_scores = []
    players.each do |p|
      score = 0
      wins = 0
      fixtures = Fixture.where(
          "player1_id = :p OR player2_id = :p",
          {:p => p.id}
      )
      fixtures.each { |f|
        f.matches.each { |m|
          whichplayer = 0
          if p.id == f.player1_id
            score += m.score1
            whichplayer = 1
          elsif p.id == f.player2_id
            score += m.score2
            whichplayer = 2
          end
          wins += 1 if whichplayer == 1 && m.score1 > m.score2
          wins += 1 if whichplayer == 2 && m.score1 < m.score2
        }
      }
      players_scores << {:player => p.name, :score => score, :wins => wins, :img => p.avatar.url(:thumb)}
    end
    players_scores.sort_by { |ps| ps[:score] }
    players_scores.reverse!

    players_scores
  end

end
