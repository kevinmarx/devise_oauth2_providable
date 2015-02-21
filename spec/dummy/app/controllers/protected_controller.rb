class ProtectedController < ApplicationController
  before_filter :authenticate_user!
  def index
    # binding.pry
    render :nothing => true, :status => :ok
  end
end
