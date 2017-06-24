module Forms
  class UserSearch
    include ActiveModel::Model
    attr_accessor *%i(email crypted_password salt)

    def self.attributes_names
      %w(email)
    end

    def initialize(params)
      @email = params[:email]
    end
  end
end
