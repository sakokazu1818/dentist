# frozen_string_literal: true

class Portal::DentistsController < ApplicationController
  before_action :set_portal_dentist, only: %i[show edit update destroy]

  # GET /portal/dentists
  # GET /portal/dentists.json
  def index
    @portal_dentists = []

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

  # Never trust parameters from the scary internet, only allow the white list through.
  def portal_dentist_params
    params.fetch(:portal_dentist, {})
  end
end
