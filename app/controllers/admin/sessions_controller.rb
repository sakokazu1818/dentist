# frozen_string_literal: true

class Admin::SessionsController < ApplicationController
  layout 'admin'

  before_action :set_admin, only: :create

  # GET /admin/sessions/new
  def new
    redirect_to admin_root_path if logged_in?
  end

  # POST /admin/sessions
  def create
    if login
      redirect_to params[:request_url].present? ? params[:request_url] : admin_root_path
    else
      redirect_to root_path
    end
  end

  # DELETE /admin/sessions/1
  def destroy
    session[:admin_id] = nil
    flash[:notice] = I18n.t('action.logout')

    redirect_to root_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin
    @admin = AdminUser.find_by(name: params[:login_name])
  end

  def login
    if @admin&.authenticate(params[:password])
      session[:admin_id] = @admin.id
      flash[:notice] = I18n.t('action.login')

      true
    else
      flash[:alert] = I18n.t('action.login_failer')

      false
    end
  end
end
