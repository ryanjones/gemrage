module Spec
  module Authentication
    
    def user_logged_in
      @controller.stub(:authenticate_user!).and_return(mock_user)
      @controller.stub(:current_user).and_return(mock_user)
    end
  end
end
