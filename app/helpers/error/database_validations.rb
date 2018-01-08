module Error
  class DatabaseValidations < StandardError
    attr_reader :object

    def initialize(message, object)
      super(message)

      @object = object
    end
  end
end
