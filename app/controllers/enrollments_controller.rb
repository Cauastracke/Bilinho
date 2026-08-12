class EnrollmentsController < ApplicationController
  before_action :set_enrollment, only: %i[ show update destroy ]

  # GET /enrollments
  def index
    if params[:student_id]
      @enrollments = Enrollment.where(student_id: params[:student_id])
    else
      @enrollments = Enrollment.all
    end

    render json: @enrollments
  end

  # GET /enrollments/1
  def show
    render json: @enrollment
  end

  # POST /enrollments
  def create
    @enrollment = Enrollment.new(enrollment_params)

    if @enrollment.save
      render json: @enrollment, status: :created, location: @enrollment
    else
      render json: @enrollment.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /enrollments/1
  def update
    if @enrollment.update(enrollment_params)
      render json: @enrollment
    else
      render json: @enrollment.errors, status: :unprocessable_content
    end
  end

  # DELETE /enrollments/1
  def destroy
    @enrollment.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enrollment
      @enrollment = Enrollment.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def enrollment_params
      params.expect(enrollment: [ :course_total_value, :max_payments, :due_date, :course_name, :educational_institution_id, :student_id ])
    end
end
