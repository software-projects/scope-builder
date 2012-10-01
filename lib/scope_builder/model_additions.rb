module ScopeBuilder
  module ModelAdditions
    def scope_builder
      builder = Builder.new(where({}))
      yield(builder) if block_given?
      builder
    end
  end
end

class ActiveRecord::Base
  extend ScopeBuilder::ModelAdditions
end

class ActiveRecord::Associations::AssociationProxy
  include ScopeBuilder::ModelAdditions
end

class ActiveRecord::Relation
  include ScopeBuilder::ModelAdditions
end
