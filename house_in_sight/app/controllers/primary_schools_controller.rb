class PrimarySchoolsController < ApplicationController
  # GET /primary_schools
  # GET /primary_schools.json
  def index
    @primary_schools = PrimarySchool.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @primary_schools }
    end
  end

  # GET /primary_schools/1
  # GET /primary_schools/1.json
  def show
    @primary_school = PrimarySchool.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @primary_school }
    end
  end

  # GET /primary_schools/new
  # GET /primary_schools/new.json
  def new
    @primary_school = PrimarySchool.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @primary_school }
    end
  end

  # GET /primary_schools/1/edit
  def edit
    @primary_school = PrimarySchool.find(params[:id])
  end

  # POST /primary_schools
  # POST /primary_schools.json
  def create
    @primary_school = PrimarySchool.new(params[:primary_school])

    respond_to do |format|
      if @primary_school.save
        format.html { redirect_to @primary_school, notice: 'Primary school was successfully created.' }
        format.json { render json: @primary_school, status: :created, location: @primary_school }
      else
        format.html { render action: "new" }
        format.json { render json: @primary_school.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /primary_schools/1
  # PUT /primary_schools/1.json
  def update
    @primary_school = PrimarySchool.find(params[:id])

    respond_to do |format|
      if @primary_school.update_attributes(params[:primary_school])
        format.html { redirect_to @primary_school, notice: 'Primary school was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @primary_school.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /primary_schools/1
  # DELETE /primary_schools/1.json
  def destroy
    @primary_school = PrimarySchool.find(params[:id])
    @primary_school.destroy

    respond_to do |format|
      format.html { redirect_to primary_schools_url }
      format.json { head :no_content }
    end
  end
end
