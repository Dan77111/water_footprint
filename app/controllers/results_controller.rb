class ResultsController < ApplicationController
  before_action :set_result, only: [:show, :edit, :update, :destroy]

  # GET /results
  # GET /results.json
  def index
    @results = User.find(params[:user_id]).results

    @average = 0
    @max = 0
    @min = @results.first.score unless @results.count == 0
    @results.each do |r|
      @average += r.score
      @max = r.score if @max < r.score
      @min = r.score if @min > r.score
    end
    @average /= @results.count unless @results.count == 0
  end

  # POST /results
  # POST /results.json
  def create

    @result = Result.new(result_params)

    puts "iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii"
    puts result_params

    respond_to do |format|
      if @result.save
        format.json { render :show, status: :created, location: @result }
      else
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_result
      @result = Result.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def result_params
      params.require(:result).permit(:score, :user_id)
    end
end
