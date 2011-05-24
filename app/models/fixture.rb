class Fixture < ActiveRecord::Base
  belongs_to :player1, :class_name => "Player", :foreign_key => "player1_id"
  belongs_to :player2, :class_name => "Player", :foreign_key => "player2_id"
  has_many :matches

  # @return [Hash]
  def score_sums
    sp1 = 0
    sp2 = 0
    wsp1 = 0
    wsp2 = 0
    matches.each { |m|
      sp1 += m.score1
      sp2 += m.score2
      wsp1 += 1 if m.score1 > m.score2
      wsp2 += 1 if m.score2 > m.score1
    }

    sp1lead = wsp1 >= wsp2 ? true : false
    sp2lead = wsp2 >= wsp1 ? true : false
    {:sp1 => sp1, :sp2 => sp2, :wsp1 => wsp1, :wsp2 => wsp2, :sp1lead => sp1lead, :sp2lead => sp2lead}
  end
end
