class ResultsController < ApplicationController
  before_action :set_result, only: %i[ show edit update destroy ]
  XSLT_TRANSFORM = "#{Rails.root}/public/xslt_transformer.xslt".freeze # Путь до xslt файла
  # GET /results or /results.json
  def index
    @results = Result.all
  end

  def show_all
    results = Result.all
    rows = ''
    result_saved = true

    results.each do |record|
      if record.save
        rows += "<cd><id>#{record.input}</id><item>#{record.result}</item></cd>"
      else
        result_saved = false
        break
      end
    end

    if result_saved
      response = "<catalog>#{rows}</catalog>"
      render xml: response
    else
      respond_to do |format|
        format.xml { render 'new', status: :unprocessable_entity }
      end
    end
  end
  # GET /results/1 or /results/1.json
  def show
  end

  # GET /results/new
  def new
    @result = Result.new
  end

  # GET /results/1/edit
  def edit
  end

  # POST /results or /results.json
  def create
    @result = Result.new(result_params)

    respond_to do |format|
      if @result.save
        format.html { redirect_to result_url(@result), notice: "Result was successfully created." }
        format.json { render :show, status: :created, location: @result }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /results/1 or /results/1.json
  def update
    respond_to do |format|
      if @result.update(result_params)
        format.html { redirect_to result_url(@result), notice: "Result was successfully updated." }
        format.json { render :show, status: :ok, location: @result }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /results/1 or /results/1.json
  def destroy
    @result.destroy!

    respond_to do |format|
      format.html { redirect_to results_url, notice: "Result was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_result
      @result = Result.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def result_params
      params.require(:result).permit(:input, :result)
    end
end
