class TopController < ApplicationController
  def contact
  	@user = current_user
  end

  def guide
  end
end
