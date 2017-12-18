class RetrieveForm
  attr_reader :form_definition

  def initialize(form_id)
    response = RestClient.get("#{Config.typeform_base_endpoint}/forms/#{form_id}")

    @form_definition = JSON.parse(response.body, symbolize_names: true)
  rescue RestClient::Exception => err
    puts "Error retrieving form with id: #{form_id} " \
         "Response code: #{err.http_code} " \
         "Response body: #{err.http_body}"

    raise 'The form cannot be created'
  end
end
