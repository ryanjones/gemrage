class RubygemsController < ApplicationController
  def show
    @rubygem = Rubygem.cs_find_by_name(params[:id])
  end
end