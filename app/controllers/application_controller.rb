class ApplicationController < ActionController::Base
  before_filter RubyCAS::Filter
  protect_from_forgery
end
