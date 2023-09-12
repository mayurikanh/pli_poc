# frozen_string_literal: true

class PersonalsController < ApplicationController
  before_action :set_personal, only: %i[show destroy update destroy]

  def index
    @personals = Personal.all
  end

  def show; end

  def new
    @personal = Personal.new
    @personal.employments.build
  end

  def edit
    @personal = Personal.find(params[:id])
    @personal.employments.build
  end

  def create
    @personal = Personal.new(personal_params)

    respond_to do |format|
      if @personal.save
        format.turbo_stream do
          redirect_to edit_personal_path(@personal.id),
                      data: { action: 'click->modal#open', turbo_stream: '' }
        end
        format.json { render :show, status: :created, location: @personal }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @personal.errors, status: :unprocessable_entity }
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace('card-form', partial: 'form'), status: :unprocessable_entity
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @personal.update(personal_employments_params)
        format.html { redirect_to personal_url(@personal), notice: 'Personal datum was successfully updated.' }
        format.json { render :show, status: :ok, location: @personal }
      else
        format.html { render :edit_personal, status: :unprocessable_entity }
        format.json { render json: @personal.errors, status: :unprocessable_entity }
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace('employment-form', partial: 'form'), status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    @personal = Personal.find(params[:id])
    @personal.destroy

    respond_to do |format|
      format.html { redirect_to personals_url, notice: 'Personal datum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_personal
    @personal = Personal.find(params[:id])
  end

  def personal_params
    params.require(:personal).permit(:first_name, :last_name, :nickname, :email_address, :phone_number)
  end

  def personal_employments_params
    params.require(:personal).permit(employments_attributes: %i[id employer start_date emplyment_end_date _destroy])
  end
end
