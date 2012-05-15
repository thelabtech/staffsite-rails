class TeamMembership < ActiveRecord::Base
  self.table_name = 'ministry_missional_team_member'
  establish_connection :uscm

  belongs_to :team, foreign_key: :teamID
  belongs_to :person, foreign_key: :personID
end
