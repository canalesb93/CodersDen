class OnlineJudgesController < ApplicationController
  before_action :set_online_judge, only: [:show, :edit, :update, :destroy]

  # GET /online_judges/1
  # GET /online_judges/1.json
  def show
  end

  # GET /online_judges/new
  def new
    @online_judge = OnlineJudge.new
  end

  # GET /online_judges/1/edit
  def edit
  end

  # POST /online_judges
  # POST /online_judges.json
  def create
    @online_judge = OnlineJudge.new(online_judge_params)
    @online_judge.user = current_user

    respond_to do |format|
      if @online_judge.save
        format.html { redirect_to current_user, notice: 'Online judge was successfully created.' }
        format.json { render :show, status: :created, location: @online_judge }
      else
        format.html { render :new }
        format.json { render json: @online_judge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /online_judges/1
  # PATCH/PUT /online_judges/1.json
  def update
    respond_to do |format|
      if @online_judge.update(online_judge_params)
        format.html { redirect_to current_user, notice: 'Online judge was successfully updated.' }
        format.json { render :show, status: :ok, location: @online_judge }
      else
        format.html { render :edit }
        format.json { render json: @online_judge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /online_judges/1
  # DELETE /online_judges/1.json
  def destroy
    @online_judge.destroy
    respond_to do |format|
      format.html { redirect_to current_user, notice: 'Online judge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_online_judge
      @online_judge = OnlineJudge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def online_judge_params
      params.require(:online_judge).permit(:site, :account_name)
    end
end
