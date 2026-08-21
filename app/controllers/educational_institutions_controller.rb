class EducationalInstitutionsController < ApplicationController
  before_action :set_educational_institution, only: %i[ show update destroy ]

  # GET /educational_institutions
  def index
    @educational_institutions = EducationalInstitution.all

    render json: @educational_institutions
  end

  # GET /educational_institutions/1
  def show
    render json: @educational_institution
  end

  # POST /educational_institutions
  def create
    @educational_institution = EducationalInstitution.new(educational_institution_params)

    if @educational_institution.save
      render json: @educational_institution, status: :created, location: @educational_institution
    else
      render json: @educational_institution.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /educational_institutions/1
  def update
    if @educational_institution.update(educational_institution_params)
      render json: @educational_institution
    else
      render json: @educational_institution.errors, status: :unprocessable_content
    end
  end

  # DELETE /educational_institutions/1
  def destroy
    if @educational_institution.update(status: "disabled")
      render json: @educational_institution
    else
      render json: @educational_institution.errors, status: :unprocessable_content
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_educational_institution
      @educational_institution = EducationalInstitution.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def educational_institution_params
      params.expect(educational_institution: [ :name, :cnpj, :tipo ])
    end
end
