class HomesController < ApplicationController

  def top
    @user = User
    @hobby = Hobby
  end

end
