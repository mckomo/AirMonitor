module Serializable

  extend ActiveSupport::Concern
  include ActiveModel::Serialization

  included do
    extend ActiveModel::Naming
  end

end