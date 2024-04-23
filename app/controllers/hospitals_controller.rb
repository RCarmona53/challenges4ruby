class HospitalsController < ApplicationController
    before_action :set_hospital, only: [:show, :update, :destroy]
    
    def index
        @hospitals = Hospital.all
        render json: @hospitals
    end

    def create
        @hospital = Hospital.new(hospital_params)

        if @hospital.save
            render json: @hospital, status: :created, location: @hospital
        else
            render json: @hospital.errors, status: :unprocessable_entity
        end
    end

    def show
        render json: @hospitals
    end

    def destroy
        @hospital.destroy
    end

    def update
        if @hospital.update(hospital_params)
            render json: @hospital
          else
            render json: @hospital.errors, status: :unprocessable_entity
          end
    end

    private
    def set_hospital
        @hospital = Hospital.find(params[:id])
    end

    def hospital_params
        params.require(:hospital).permit(:name, :address, :city, :state, :zipcode)
    end
end
