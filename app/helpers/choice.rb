class Choice
  attr_reader :label, :ref

  def initialize(label:, ref:)
    @label = label
    @ref = ref
  end

  def to_payload
    {
      label: label,
      ref: ref
    }
  end
end
