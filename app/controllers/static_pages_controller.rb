class StaticPagesController < ApplicationController

  # before_filter :authorize

  def home
  end

  def info
  end

  def calculator
  end

  def temp_result
    result = params.require(:static_page)[:result]
    puts "___________________________________________________________________________"
    puts params.require(:static_page)
    puts result

    if result
      cookies[:result] = result
    end

    render :nothing => true
  end
end
