# frozen_string_literal: true

class Admin::SessionsController < ApplicationController
  layout 'admin'

  before_action :set_admin_session, only: []

  # GET /admin/sessions/new
  def new
    @admin_session = Admin::Session.new
  end

  # POST /admin/sessions
  def create; end

  # DELETE /admin/sessions/1
  def destroy
    @admin_session.destroy
    respond_to do |format|
      format.html { redirect_to admin_sessions_url, notice: 'Session was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin_session
    @admin_session = Admin::Session.find(params[:id])
  end
end
