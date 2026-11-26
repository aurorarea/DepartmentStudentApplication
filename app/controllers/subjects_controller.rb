class SubjectsController < ApplicationController
  before_action :set_subject, only: %i[ show edit update destroy ]
  before_action :require_admin!, except: %i[ index show ]

  # GET /subjects or /subjects.json
  def index
    @q = Subject.ransack(params[:q])

      respond_to do |format|
      format.html do
        @pagy, @subjects= pagy(:offset, @q.result.includes(:teacher).order(:name), limit: 10)
      end
      format.xlsx do
        @subjects= @q.result.includes(:teacher).order(:name)
        render xlsx: "index", filename: "#{controller_name.titleize}_List.xlsx"
      end
    end
  end

  # GET /subjects/1 or /subjects/1.json
  def show
  end

  # GET /subjects/new
  def new
    @subject = Subject.new
  end

  # GET /subjects/1/edit
  def edit
  end

  # POST /subjects or /subjects.json
  def create
    @subject = Subject.new(subject_params)

    respond_to do |format|
      if @subject.save
        format.html { redirect_to @subject, notice: "Subject was successfully created." }
        format.json { render :show, status: :created, location: @subject }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @subject.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /subjects/1 or /subjects/1.json
  def update
    respond_to do |format|
      if @subject.update(subject_params)
        format.html { redirect_to @subject, notice: "Subject was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @subject }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @subject.errors, status: :unprocessable_content }
      end
    end
  end

# DELETE /subjects/1 or /subjects/1.json
def destroy
  respond_to do |format|
    if @subject.destroy
      format.html { redirect_to subjects_path, notice: "Subject was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    else
      format.html { redirect_to subjects_path, alert: @subject.errors.full_messages.to_sentence, status: :see_other }
      format.json { render json: @subject.errors, status: :unprocessable_content }
    end
  end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def subject_params
      params.expect(subject: [ :name, :teacher_id, :sectionCount ])
    end
end
