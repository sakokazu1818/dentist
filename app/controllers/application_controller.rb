# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :logged_in?

  def set_contents_sp
    c_n = controller_name
    @contents_sp = [
      { text: '当院について', img_name: 'icon_clinic.png',
        link: c_n == 'abouts' ? '#' : portal_abouts_path },
      { text: '院長あいさつ', img_name: 'icon_doctor.png',
        link: c_n == 'recruits' ? '#' : portal_director_introducings_path },
      { text: '施設案内', img_name: 'icon_facilities-guide.png',
        link: c_n == 'facilities' ? '#' : portal_facilities_path },
      { text: '初めての方へ', img_name: 'icon_medical_flow.png',
        link: c_n == 'flow_examinations' ? '#' : portal_flow_examinations_path },
      { text: '訪問診察', img_name: 'icon_visit_consultation.png',
        link: c_n == 'visit_to_visits' ? '#' : portal_visit_to_visits_path },
      { text: '採用情報', img_name: 'icon_job.png',
        link: c_n == 'recruits' ? '#' : portal_recruits_path }
    ]
  end

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
