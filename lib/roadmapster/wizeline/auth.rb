module Roadmapster
  module Wizeline
    class Auth
      include Roadmapster::Wizeline::BaseApi

      def initialize(email:, password:)
        @email = email
        @password = password
        @token ||= nil
      end

      def token
        @token ||= post('auth/login', { email: @email, password: @password })[:auth][:token]
      end
    end
  end
end
