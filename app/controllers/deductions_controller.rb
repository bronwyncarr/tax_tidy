class DeductionsController < ApplicationController
  before_action :set_deduction, only: [:show, :edit, :update, :destroy]
  before_action :deductions_by_user, only: [:index, :chart]

  # GET /deductions
  # GET /deductions.json
  def index
  end

  def chart
  end

  # GET /deductions/1
  # GET /deductions/1.json
  def show
  end

  # GET /deductions/new
  def new
    @deduction = Deduction.new
  end

  # GET /deductions/1/edit
  def edit
  end

  # POST /deductions
  # POST /deductions.json
  def create
    @deduction = Deduction.new(deduction_params)
    @deduction.user_id = current_user.id

    respond_to do |format|
      if @deduction.save
        format.html { redirect_to @deduction, notice: 'Deduction was successfully created.' }
        format.json { render :show, status: :created, location: @deduction }
      else
        format.html { render :new }
        format.json { render json: @deduction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deductions/1
  # PATCH/PUT /deductions/1.json
  def update
    respond_to do |format|
      if @deduction.update(deduction_params)
        format.html { redirect_to @deduction, notice: 'Deduction was successfully updated.' }
        format.json { render :show, status: :ok, location: @deduction }
      else
        format.html { render :edit }
        format.json { render json: @deduction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deductions/1
  # DELETE /deductions/1.json
  def destroy
    @deduction.destroy
    respond_to do |format|
      format.html { redirect_to deductions_url, notice: 'Deduction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def deductions_by_user
      @deductions = Deduction.where(user: current_user[:id])
    end

    def set_deduction
      @deduction = Deduction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def deduction_params
      params.require(:deduction).permit(:expense, :description, :amount, :category, :year, :image)
    end
end
