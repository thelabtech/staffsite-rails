class Person < ActiveRecord::Base
  self.table_name = 'ministry_person'
  self.primary_key = 'personID'
  establish_connection :uscm

  belongs_to :user, foreign_key: :fk_ssmUserId
  has_many :team_memberships, foreign_key: :personID
  has_many :teams, through: :team_memberships

  def account_balance
    #TODO: Use classes and arel (at least through user), not manual query
    Person.connection.select_value("select `value` from infobase_bookmarks pref join `simplesecuritymanager_user` user on pref.user_id = user.`UserID` join ministry_person p on p.fk_ssmUserId = user.UserID where p.personID = #{id} AND pref.name = 'balance'").to_f
  end

  def first_name
    preferredName.present? ? preferredName : firstName
  end

end
