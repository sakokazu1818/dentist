# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :logged_in?

  def set_contents_sp
    @contents_sp = [
      [{ text: '当院について', img_name: 'icon_clinic.png',
         link: portal_abouts_path },
       { text: '院長紹介', img_name: 'icon_doctor.png',
         link: portal_director_introducings_path },
       { text: '施設案内', img_name: 'icon_facilities-guide.png',
         link: portal_facilities_path },
       { text: '診察の流れ', img_name: 'icon_medical_flow.png',
         link: portal_flow_examinations_path }],
      [{ text: '訪問診察', img_name: 'icon_visit_consultation.png',
         link: portal_visit_to_visits_path },
       { text: '診療時間、アクセス', img_name: ['icon_medical_hours.png', 'icon_access.png'],
         link: portal_time_and_accesses_path },
       { text: '採用情報', img_name: 'icon_job.png', link: portal_recruits_path }]
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
