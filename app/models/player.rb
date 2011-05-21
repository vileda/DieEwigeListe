class Player < ActiveRecord::Base
  has_many :fixtures
  has_many :matches, :through => :fixtures
  has_attached_file :avatar, :styles => {:medium => "300x300>", :thumb => "100x100>", :mini => "75x75>"}, :path => ":rails_root/public/system/:attachment/:id/:style/:filename"

  def self.ladder
    players = Player.find :all
    players_scores = []
    players.each { |p|
      score = 0
      fixtures = Fixture.where(
          "player1_id = :p OR player2_id = :p",
          {:p => p.id}
      )
      fixtures.each { |f|
        f.matches.each { |m|
          if p.id == f.player1_id
            score += m.score1
          elsif p.id == f.player2_id
            score += m.score2
          end
        }
      }
      players_scores << {:player => p.name, :score => score}
    }
    players_scores.sort_by { |ps| ps[:score] }
    players_scores.reverse!

    return players_scores
  end

end
