module Forms
  class TodoSearch
    include ActiveModel::Model
    attr_accessor *%i(user_id title note due_date completed_on repeat urgent)
  end
end
