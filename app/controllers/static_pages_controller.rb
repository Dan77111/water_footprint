class StaticPagesController < ApplicationController

  def home
  end

  def info
  end

  def calculator
  end

  def temp_result
    result = params.require(:static_page)[:result]

    if result
      cookies[:result] = result
    end

    render :nothing => true
  end
end
