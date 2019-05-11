class Portal::FlowExaminationsController < ApplicationController
  before_action :set_portal_flow_examination, only: [:show, :edit, :update, :destroy]

  # GET /portal/flow_examinations
  # GET /portal/flow_examinations.json
  def index
    @portal_flow_examinations = Portal::FlowExamination.all
  end

  # GET /portal/flow_examinations/1
  # GET /portal/flow_examinations/1.json
  def show
  end

  # GET /portal/flow_examinations/new
  def new
    @portal_flow_examination = Portal::FlowExamination.new
  end

  # GET /portal/flow_examinations/1/edit
  def edit
  end

  # POST /portal/flow_examinations
  # POST /portal/flow_examinations.json
  def create
    @portal_flow_examination = Portal::FlowExamination.new(portal_flow_examination_params)

    respond_to do |format|
      if @portal_flow_examination.save
        format.html { redirect_to @portal_flow_examination, notice: 'Flow examination was successfully created.' }
        format.json { render :show, status: :created, location: @portal_flow_examination }
      else
        format.html { render :new }
        format.json { render json: @portal_flow_examination.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /portal/flow_examinations/1
  # PATCH/PUT /portal/flow_examinations/1.json
  def update
    respond_to do |format|
      if @portal_flow_examination.update(portal_flow_examination_params)
        format.html { redirect_to @portal_flow_examination, notice: 'Flow examination was successfully updated.' }
        format.json { render :show, status: :ok, location: @portal_flow_examination }
      else
        format.html { render :edit }
        format.json { render json: @portal_flow_examination.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portal/flow_examinations/1
  # DELETE /portal/flow_examinations/1.json
  def destroy
    @portal_flow_examination.destroy
    respond_to do |format|
      format.html { redirect_to portal_flow_examinations_url, notice: 'Flow examination was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portal_flow_examination
      @portal_flow_examination = Portal::FlowExamination.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def portal_flow_examination_params
      params.fetch(:portal_flow_examination, {})
    end
end
