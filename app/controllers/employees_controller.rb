class EmployeesController < ApplicationController

    def index
        @employees = Employee.all
    end

    def show
        locate_employee
    end

    def new
        @employee = Employee.new
    end

    def create
        @employee = Employee.new(employee_params)
        if @employee.save
            redirect_to @employee
        else
            render :new
        end
    end

    def edit
        locate_employee
    end

    def update
        locate_employee
        if @employee.update(employee_params)
            redirect_to @employee
        else
            render :edit
        end   
    end

    private

    def locate_employee
        @employee = Employee.find(params[:id])
    end

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
    end
end
