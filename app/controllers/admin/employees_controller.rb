class Admin::EmployeesController < AdminController
  before_action :set_employee, only: %i[ show edit update destroy ]

  def index
    @q = Employee.ransack(params[:q])
    @employees = @q.result(distinct: true).page(params[:page])
    respond_to do |format|
      format.html
      format.csv { send_data ExportService::EmployeeExport.new(@q.result).to_csv, filename: "Employee-#{DateTime.current}.csv" }
    end
  end

  def show; end

  def new
    @employee = Employee.new
  end

  def edit; end

  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to admin_employee_url(@employee), notice: "Employee was successfully created." }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1 or /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to admin_employee_url(@employee), notice: "Employee was successfully updated." }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @employee.destroy

    respond_to do |format|
      format.html { redirect_to admin_employees_url, notice: "Employee was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_employee
      @employee = Employee.find(params[:id])
    end

    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :personal_email, :work_email, :permanent_mobile_number, :alternate_mobile_number, :permanent_address, :resedential_address, :date_of_birth, :gender)
    end
end
