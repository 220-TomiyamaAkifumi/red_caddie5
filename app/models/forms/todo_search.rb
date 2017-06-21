module Forms
  class TodoSearch
    include ActiveModel::Model
    attr_accessor *%i(user_id title note due_date_from due_date_to completed_on_from completed_on_to repeat urgent)

    def self.attributes_names
      %w(user_id title note due_date_from due_date_to completed_on_from completed_on_to repeat urgent)
    end

    def initialize(params)
      @user_id = params[:user_id]
      @title = params[:title]
      @note = params[:note]
      @due_date_from =
        params[:due_date_from].present? ?
          Date.parse(params[:due_date_from]) : Date.current.beginning_of_month
      @due_date_to =
        params[:due_date_to].present? ?
          Date.parse(params[:due_date_to]) : Date.current.end_of_month
      @completed_on_from =
        params[:completed_on_from].present? ?
          Date.parse(params[:completed_on_from]) : Date.current.beginning_of_month
      @completed_on_to =
        params[:completed_on_to].present? ?
          Date.parse(params[:completed_on_to]) : Date.current.end_of_month
      @repeat = params[:repeat]
      @urgent = params[:urgent]
    end
  end
end
