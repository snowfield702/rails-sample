# frozen_string_literal: true

class FizzBuzzsController < ApplicationController
  def show
    render json: FizzBuzz.find(params[:id])
  end

  def create
    render json: FizzBuzz.create(create_params)
  end

  private

  def create_params
    params.permit(:number)
  end
end
