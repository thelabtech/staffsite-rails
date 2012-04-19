class ApplicationController < ActionController::Base
  before_filter CASClient::Frameworks::Rails::Filter
  before_filter :ensure_staff
  protect_from_forgery

  protected
  def ensure_staff
    unless current_person && current_person.isStaff?
      redirect_to '/no_access'
    end
  end

  def current_user
    return @current_user if @current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    else
      @current_user = User.find_by_globallyUniqueID(session[:cas_extra_attributes][:ssoGuid])
    end
  end
  helper_method :current_user

  def current_person
    @current_person ||= current_user.try(:person)
  end
  helper_method :current_person
end
