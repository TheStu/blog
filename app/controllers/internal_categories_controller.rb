class InternalCategoriesController < ApplicationController
  before_action :set_internal_category, only: [:show, :edit, :update, :destroy]

  # GET /internal_categories
  # GET /internal_categories.json
  # def index
  #   @internal_categories = InternalCategory.all
  # end

  # GET /internal_categories/1
  # GET /internal_categories/1.json
  # def show
  # end

  # GET /internal_categories/new
  def new
    @internal_category = InternalCategory.new
  end

  # GET /internal_categories/1/edit
  def edit
  end

  # POST /internal_categories
  # POST /internal_categories.json
  def create
    @internal_category = InternalCategory.new(internal_category_params)

    respond_to do |format|
      if @internal_category.save
        format.html { redirect_to new_internal_category_path, notice: 'Internal category was successfully created.' }
        format.json { render action: 'show', status: :created, location: @internal_category }
      else
        format.html { render action: 'new' }
        format.json { render json: @internal_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /internal_categories/1
  # PATCH/PUT /internal_categories/1.json
  def update
    respond_to do |format|
      if @internal_category.update(internal_category_params)
        format.html { redirect_to brands_path, notice: 'Internal category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @internal_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /internal_categories/1
  # DELETE /internal_categories/1.json
  def destroy
    @internal_category.destroy
    respond_to do |format|
      format.html { redirect_to brands_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_internal_category
      @internal_category = InternalCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def internal_category_params
      params.require(:internal_category).permit(:name)
    end
end
