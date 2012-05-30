class ApplicationController < ActionController::Base
  before_filter CASClient::Frameworks::Rails::Filter
  protect_from_forgery

  protected

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

  def after_sign_out_path_for(*)
    session[:user_id] = nil
    session[:cas_sent_to_gateway] = nil
    session[:cas_validation_retry_count] = nil
    session[:previous_redirect_to_cas] = nil
    session[:cas_user] = nil
    session[:casfilteruser] = nil
    session[:cas_last_valid_ticket] = nil
    session[:cas_last_valid_ticket_service] = nil

    'https://signin.relaysso.org/cas/logout'
  end
end
