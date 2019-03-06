# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :logged_in?

  private

  def restrict_access
    return if logged_in?

    flash[:request_url] = request.url if params[:request_url].blank?
    flash[:alert] = t('action.registration_or_login_required')
    session[:admin_id] = nil

    redirect_to root_path
  end

  def logged_in?
    session[:admin_id] && AdminUser.find(session[:admin_id])
  end

  def current_admin
    AdminUser.find(session[:admin_id])
  end
end
