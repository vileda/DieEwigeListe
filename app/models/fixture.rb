class Fixture < ActiveRecord::Base
  belongs_to :player1, :class_name => "Player", :foreign_key => "player1_id"
  belongs_to :player2, :class_name => "Player", :foreign_key => "player2_id"
  has_many :matches

  def score_sums
    sp1 = 0
    sp2 = 0
    matches.each { |m|
      sp1 += m.score1
      sp2 += m.score2
    }

    sp1lead = sp1 >= sp2 ? true : false
    sp2lead = sp2 >= sp1 ? true : false
    return {:sp1 => sp1, :sp2 => sp2, :sp1lead => sp1lead, :sp2lead => sp2lead}
  end
end
