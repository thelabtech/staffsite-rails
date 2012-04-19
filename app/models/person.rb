class Person < ActiveRecord::Base
  self.table_name = 'ministry_person'
  self.primary_key = 'personID'
  establish_connection :uscm

  belongs_to :user, foreign_key: :fk_ssmUserId

  def account_balance
    Person.connection.select_value("select `value` from staffsite_staffsitepref pref join `staffsite_staffsiteprofile` prof on pref.fk_StaffsiteProfile = prof.`StaffSiteProfileID` join ministry_person p on p.accountNo = prof.accountNo where p.personID = #{id} AND pref.name = 'CURRENT_BALANCE'").to_f
  end

end
