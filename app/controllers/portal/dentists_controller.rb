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
    #
    # @sticking = [{title: '①	車が停めやすい広々駐車場', img: '駐車場画像',
    #     text: "最大駐車数20台。\n 広い駐車スペースで安心した通院を実現。"},
    #   {title: '②	徹底した衛生管理', img: '院内画像',
    #     text: '清潔な院内環境作りと最高レベルの滅菌機器で、徹底した衛生管理に勤めています。'},
    #   {title: '③	丁寧なカウンセリング', img: 'カウンセリング画像',
    #     text: "初診時には必ずカウンセリングルームにてカウンセリングを実施。\n患者様の不安の解消・ベストな治療法の選択を行なっております。"},
    #   {title: '④	口腔内画像の保管', img: '口腔画像', text: "口腔内写真をカルテと共に保管。\n 次回治療に活用致します。"},
    #   {title: '⑤	検査結果のお渡し', img: '検査結果画像', text: '患者様自身でご自身の口腔状況を把握していただきやすいよう。検査結果を印刷してお渡ししております。'},
    #   {title: '⑥	できる限り痛くない麻酔', img: '麻酔画像',
    #     text: "麻酔処置が痛いという患者様も少なくありません。\n 当院では麻酔処置もできる限り痛くないよう務めております。"},
    #   {title: '⑦	将来を見越した治療', img: '麻酔画像', text: "1, できる限り歯を削らない\n2, できる限り神経は抜かない\n3, できる限り抜歯しない\n当院では以上の事を心がけ将来を見越した治療を行なっています。"},
    #   {title: '⑧	定期検診の実施', img: '定期検診画像', text: '定期検診を行う事で予防治療にも力を入れています。'},
    #   {title: '⑨	訪問診療の実施', img: '訪問診療画像', text: 'お体が不自由な方や、お子様の為当院では訪問診療も実施しております。'},
    #   {title: '⑩	事前同意の徹底', img: '同意画像', text: '当院では必ず同意を得た上で治療を行います。医師による勝手な判断での治療は行いません。'},
    #   {title: '⑪	広々とした診療室', img: '診療室画像', text: "広々とした診療室をご用意させていただいております。ベビーカーと一緒に診療室へ入れます。\nベビーカーや車椅子のお客様もご安心してご来院ください。"}]

    @sticking = [{
      title: '① 車が停めやすい広々駐車場', img: 'sticking1',text: "最大駐車数20台。\n 広い駐車スペースで安心した通院を実現。", details: false},
      {title: '② 徹底した衛生管理', img: 'sticking2', text: '清潔な院内環境作りと最高レベルの滅菌機器で、徹底した衛生管理に勤めています。', details: true},
      {title: '③ 検査結果のお渡し', img: 'sticking3', text: '患者様自身でご自身の口腔状況を把握していただきやすいよう。検査結果を印刷してお渡ししております。', details: false},
      {title: '④ 将来を見越した治療', img: 'sticking4', text: "1, できる限り歯を削らない\n2, できる限り神経は抜かない\n3, できる限り抜歯しない\n当院では以上の事を心がけ将来を見越した治療を行なっています。", details: false},
      {title: '⑤ 訪問診療の実施', img: 'sticking5', text: 'お体が不自由な方や、お子様の為当院では訪問診療も実施しております。', details: true},
      {title: '⑥ 広々とした診療室', img: 'sticking6', text: "広々とした診療室をご用意させていただいております。ベビーカーと一緒に診療室へ入れます。\nベビーカーや車椅子のお客様もご安心してご来院ください。", details: false}]
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
    return set_contents_sp if request.smart_phone?

    @contents = [
      [{ text: '当院について', img_name: 'icon_clinic.png' },
       { text: '院長紹介', img_name: 'icon_doctor.png' },
       { text: '施設案内', img_name: 'icon_facilities-guide.png' },
       { text: '診察の流れ', img_name: 'icon_medical_flow.png' },
       { text: '訪問診察', img_name: 'icon_visit_consultation.png' },
       { text: '診療時間、アクセス', img_name: ['icon_medical_hours.png',
                                                'icon_access.png'] },
       { text: '採用情報', img_name: 'icon_job.png' }]
    ]
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def portal_dentist_params
    params.fetch(:portal_dentist, {})
  end
end
