module Spec
  module Mocks
    
    def mock_user(stubs={})
      @mock_user || mock_model(User, stubs)
    end

    def mock_payload(stubs={})
      @mock_payload || mock_model(Payload, stubs)
    end
  end
end
