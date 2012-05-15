class Team < ActiveRecord::Base
  self.table_name = 'ministry_locallevel'
  self.primary_key = 'teamID'
  establish_connection :uscm

end
