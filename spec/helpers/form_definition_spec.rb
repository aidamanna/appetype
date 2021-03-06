describe FormDefinition do
  describe '#choice_with_label' do
    it 'fails if the form does not have fields' do
      form_definition = { fields: [] }
      form = FormDefinition.new(form_definition)
      expect { form.choice_ref('1', 'Home office - Omni') }.to raise_error 'No field with id: 1'
    end

    it 'fails when the field id exists but does not contain a choice with the given label' do
      form_definition = {
        fields: [
          id: '1',
          type: 'multiple_choice',
          properties: {
            choices: [
              {
                ref: 'monday-home-veggie',
                label: 'Home office - Veggie'
              }
            ]
          }
        ]
      }
      form = FormDefinition.new(form_definition)
      expect { form.choice_ref('1', 'Home office - Omni') }
        .to raise_error 'No choice with label: Home office - Omni'
    end

    it 'returns the choice ref when the form has a multiple choice with the label' do
      form_definition = {
        fields: [
          id: '1',
          type: 'multiple_choice',
          properties: {
            choices: [
              {
                ref: 'monday-home-omni',
                label: 'Home office - Omni'
              }
            ]
          }
        ]
      }
      form = FormDefinition.new(form_definition)
      expect(form.choice_ref('1', 'Home office - Omni')).to eql('monday-home-omni')
    end
  end
end
