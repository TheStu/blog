class GearGuidesController < ApplicationController
  before_action :set_gear_guide, only: [:show, :edit, :update, :destroy]

  include PostCount # for unless bot? method in private

  # GET /gear_guides
  # GET /gear_guides.json
  # def index
  #   @gear_guides = GearGuide.all
  # end

  # GET /gear_guides/1
  # GET /gear_guides/1.json
  def show
    impression_count(@gear_guide)
    @popular = GearGuide.order('view_count DESC').first(4)
  end

  # GET /gear_guides/new
  def new
    @gear_guide = GearGuide.new
  end

  # GET /gear_guides/1/edit
  def edit
  end

  # POST /gear_guides
  # POST /gear_guides.json
  def create
    @gear_guide = GearGuide.new(gear_guide_params)
    @gear_guide.user_id = current_user.id

    respond_to do |format|
      if @gear_guide.save
        format.html { redirect_to @gear_guide, notice: 'Gear guide was successfully created.' }
        format.json { render action: 'show', status: :created, location: @gear_guide }
      else
        format.html { render action: 'new' }
        format.json { render json: @gear_guide.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gear_guides/1
  # PATCH/PUT /gear_guides/1.json
  def update
    respond_to do |format|
      @gear_guide.user_id = current_user.id
      if @gear_guide.update(gear_guide_params)
        format.html { redirect_to @gear_guide, notice: 'Gear guide was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @gear_guide.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gear_guides/1
  # DELETE /gear_guides/1.json
  def destroy
    @gear_guide.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gear_guide
      @gear_guide = GearGuide.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gear_guide_params
      params.require(:gear_guide).permit(:user_id, :title, :content, :meta_description)
    end

    def impression_count(guide)
      unless bot?(request.user_agent)
        guide.update_attributes(view_count: guide.view_count + 1)
      end
    end
end
