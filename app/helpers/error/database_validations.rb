module Error
  class DatabaseValidations < StandardError
    attr_reader :errors

    def initialize(message, errors)
      super(message)

      @errors = errors
    end
  end
end
