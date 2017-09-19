class Form

  def initialize(form_definition)
    @form_definition = form_definition
  end

  def choice_ref(field_id, choice_label)
    field = multiple_choice_with_id(field_id)
    choice = choice_with_label(choice_label, field)

    choice[:ref]
  end

  private

  def multiple_choice_with_id(field_id)
    field = @form_definition[:fields].find {|field| field[:id] == field_id && field[:type] == 'multiple_choice'}

    raise "No field with id: #{field_id}" if field.nil?
    field
  end

  def choice_with_label(choice_label, field)
    choice = field[:properties][:choices].find {|choice| choice[:label] == choice_label}

    raise "No choice with label: #{choice_label}" if choice.nil?
    choice
  end
end
