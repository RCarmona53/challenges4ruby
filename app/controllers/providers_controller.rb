class ProvidersController < ApplicationController
  before_action :set_provider, only: [:show, :update, :destroy]

  def index
    @providers = Provider.all
    render json: @providers
  end

  def show
    render json: @provider
  end

  def create
    @provider = Provider.new(provider_params)

    if @provider.save
      render json: @provider, status: :created, location: @provider
    else
      render json: @provider.errors, status: :unprocessable_entity
    end
  end

  def update
    if @provider.update(provider_params)
      render json: @provider
    else
      render json: @provider.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @provider.destroy
  end

  private
    def set_provider
      @provider = Provider.find(params[:id])
    end

    def provider_params
      params.require(:provider).permit(:name, :address, :phone)
    end
end
