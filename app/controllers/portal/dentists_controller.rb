# frozen_string_literal: true

class Portal::DentistsController < ApplicationController
  before_action :set_portal_dentist, only: %i[show edit update destroy]
  before_action :set_index_variable, only: %i[index]

  # GET /portal/dentists
  # GET /portal/dentists.json
  def index
    @notification = Admin::Notification.all

    unless request.from_pc? || request.from_android_tablet? || request.from_ipad?
      render :index_smart_phone, layout: 'smart_phone.html.haml'
      return
    end
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
    unless request.from_pc? || request.from_android_tablet? || request.from_ipad?
      set_contents_sp
    else
      set_contents
    end

    set_sticking
  end

  def set_sticking
    @sticking = [
      { title: "① かかりつけ歯科医機能強化型歯科診療所に認定",
        img: 'かかりつけ機能強化型.JPG',
        text: "当院は多くの高度な施設基準や実績をクリアしているため皆様に安心して受診して頂けます。\
              またこの基準をクリアしているため、皆様のお口の健康をより詳細に管理する事が可能となりました。\
              \n※この施設基準をクリアしている歯科医院は全国の医院の10%ほどだけです。",
        details: true },
      { title: '② 複数の歯科衛生士の在籍',
        img: '複数の衛生士の在籍.JPG',
        text: "国家資格を有するプロの歯科衛生士があなたのお口の中の健康管理を責任を持って行います。\
              また、複数の衛生士が在籍しておりますので、予約も出来るだけお待たせ致しません。",
        details: true },
      { title: '③ 徹底した衛生管理',
        img: 'sticking2.jpg',
        text: '清潔な院内環境作りと最高レベルの滅菌機器で、徹底した衛生管理に勤めています。',
        details: true },
      { title: '④ 車が停めやすい広々駐車場',
        img: '駐車場.JPG',
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
      { title: '⑦ 保育士スタッフ',
        img: '保育士.JPG',
        text: "当院には保育士免許を有したスタッフがいるため、小さなお子様がいても安心して治療が受けられます。",
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
