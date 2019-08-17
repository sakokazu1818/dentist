# frozen_string_literal: true

class Portal::DentistsController < ApplicationController
  before_action :set_portal_dentist, only: %i[show edit update destroy]
  before_action :set_index_variable, only: %i[index]

  # GET /portal/dentists
  # GET /portal/dentists.json
  def index
    # TDOO
    # @notification = Admin::Notification.all
    @notification = [Admin::Notification.new(created_at: Time.now, text: 'おしらせ1'),
                     Admin::Notification.new(created_at: Time.now, text: 'おしらせ2'),
                     Admin::Notification.new(created_at: Time.now, text: 'おしらせ3')]

    render :index_smart_phone, layout: 'smart_phone.html.haml' if request.smart_phone?
  end

  # GET /portal/dentists/1
  # GET /portal/dentists/1.json
  def show; end

  # GET /portal/dentists/new
  def new
    @portal_dentist = Portal::Dentist.new
  end

  # GET /portal/dentists/1/edit
  def edit; end

  # POST /portal/dentists
  # POST /portal/dentists.json
  def create
    @portal_dentist = Portal::Dentist.new(portal_dentist_params)

    respond_to do |format|
      if @portal_dentist.save
        format.html { redirect_to @portal_dentist, notice: 'Dentist was successfully created.' }
        format.json { render :show, status: :created, location: @portal_dentist }
      else
        format.html { render :new }
        format.json { render json: @portal_dentist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /portal/dentists/1
  # PATCH/PUT /portal/dentists/1.json
  def update
    respond_to do |format|
      if @portal_dentist.update(portal_dentist_params)
        format.html { redirect_to @portal_dentist, notice: 'Dentist was successfully updated.' }
        format.json { render :show, status: :ok, location: @portal_dentist }
      else
        format.html { render :edit }
        format.json { render json: @portal_dentist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portal/dentists/1
  # DELETE /portal/dentists/1.json
  def destroy
    @portal_dentist.destroy
    respond_to do |format|
      format.html { redirect_to portal_dentists_url, notice: 'Dentist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_portal_dentist
    @portal_dentist = Portal::Dentist.find(params[:id])
  end

  def set_index_variable
    @portal_dentists = []
    if request.smart_phone?
      set_contents_sp
      set_sticking
    else
      set_contents
    end
  end

  def set_contents
    @contents = [
      [{ text: '当院について', img_name: 'icon_clinic.png' },
       { text: '施設案内', img_name: 'icon_facilities-guide.png' },
       { text: '初めての方へ', img_name: 'icon_medical_flow.png' },
       { text: '訪問診察', img_name: 'icon_visit_consultation.png' },
       { text: '診療時間、アクセス', img_name: ['icon_medical_hours.png',
                                                'icon_access.png'] },
       { text: '採用情報', img_name: 'icon_job.png' }]
    ]
  end

  def set_sticking
    @sticking = [
      { title: "① 厚生労働省が定める、\nかかりつけ歯科医機能強化型歯科診療所に認定",
        img: 'https://placehold.jp/150x150.png?text=ダミー',
        text: "当院は厚労省が定める多くの高度な施設基準や実績をクリアしているため皆様に安心して受診して頂けます。\
              またこの基準をクリアしているため、皆様のお口の健康をより詳細に管理する事が可能となりました。\
              \n※この施設基準をクリアしている歯科医院は全国の医院の10%ほどだけです。",
        details: true },
      { title: '② 複数の歯科衛生士の在籍',
        img: 'https://placehold.jp/150x150.png?text=ダミー',
        text: "国家資格を有するプロの歯科衛生士があなたのお口の中の健康管理を責任を持って行います。\
              また、複数の衛生士が在籍しておりますので、予約も出来るだけお待たせ致しません。",
        details: true },
      { title: '③ 徹底した衛生管理',
        img: 'sticking2.jpg',
        text: '清潔な院内環境作りと最高レベルの滅菌機器で、徹底した衛生管理に勤めています。',
        details: true },
      { title: '④ 車が停めやすい広々駐車場',
        img: 'sticking1.jpg',
        text: "最大駐車数20台。\n 広い駐車スペースで安心した通院を実現。\n ※駐車が苦手な女性でも安心して止められます",
        details: false },
      { title: '⑤ 訪問診療の実施',
        img: 'sticking5.jpg',
        text: "お体が不自由な方や、お子様の為当院では訪問診療も実施しております。\n ※認定訪問歯科衛生士の在籍",
        details: true },
      { title: '⑥ 検査結果のお渡し',
        img: 'sticking3.jpg',
        text: '患者様自身でご自身の口腔状況を把握していただきやすいよう。検査結果を印刷してお渡ししております。',
        details: false },
      { title: '⑦ 将来を見越した治療',
        img: 'sticking4.jpg',
        text: "1, できる限り歯を削らない\n2, できる限り神経は抜かない\n3, できる限り抜歯しない\n当院では以上の事を心がけ将来を見越した治療を行なっています。",
        details: false },
      { title: '⑧ 広々とした診療室',
        img: 'sticking6.jpg',
        text: "広々とした診療室をご用意させていただいております。ベビーカーと一緒に診療室へ入れます。\nベビーカーや車椅子のお客様もご安心してご来院ください。",
        details: false }
    ]
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def portal_dentist_params
    params.fetch(:portal_dentist, {})
  end
end
