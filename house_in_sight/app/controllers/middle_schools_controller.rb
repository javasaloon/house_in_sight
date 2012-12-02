class MiddleSchoolsController < ApplicationController
  # GET /middle_schools
  # GET /middle_schools.json
  def index
    @middle_schools = MiddleSchool.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @middle_schools }
    end
  end

  # GET /middle_schools/1
  # GET /middle_schools/1.json
  def show
    @middle_school = MiddleSchool.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @middle_school }
    end
  end

  # GET /middle_schools/new
  # GET /middle_schools/new.json
  def new
    @middle_school = MiddleSchool.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @middle_school }
    end
  end

  # GET /middle_schools/1/edit
  def edit
    @middle_school = MiddleSchool.find(params[:id])
  end

  # POST /middle_schools
  # POST /middle_schools.json
  def create
    @middle_school = MiddleSchool.new(params[:middle_school])

    respond_to do |format|
      if @middle_school.save
        format.html { redirect_to @middle_school, notice: 'Middle school was successfully created.' }
        format.json { render json: @middle_school, status: :created, location: @middle_school }
      else
        format.html { render action: "new" }
        format.json { render json: @middle_school.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /middle_schools/1
  # PUT /middle_schools/1.json
  def update
    @middle_school = MiddleSchool.find(params[:id])

    respond_to do |format|
      if @middle_school.update_attributes(params[:middle_school])
        format.html { redirect_to @middle_school, notice: 'Middle school was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @middle_school.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /middle_schools/1
  # DELETE /middle_schools/1.json
  def destroy
    @middle_school = MiddleSchool.find(params[:id])
    @middle_school.destroy

    respond_to do |format|
      format.html { redirect_to middle_schools_url }
      format.json { head :no_content }
    end
  end
end
