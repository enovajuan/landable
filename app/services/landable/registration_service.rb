require_dependency "landable/author"

module Landable
  class RegistrationService
    def self.call(attributes)
      if author = Author.where(username: attributes[:username]).first
        author
      else
        Author.create!(attributes.slice(:username, :email, :first_name, :last_name))
      end
    end
  end
end
