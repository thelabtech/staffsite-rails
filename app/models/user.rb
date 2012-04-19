class User < ActiveRecord::Base
  self.table_name = 'simplesecuritymanager_user'
  self.primary_key = 'userID'
  establish_connection :uscm

  has_one :person, foreign_key: 'fk_ssmUserId'

end
