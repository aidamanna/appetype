class OauthTokenCreator
  def call(temp_auth_code)
    token = OauthClient.new.retrieve_token(temp_auth_code)
    setting = Setting.find_by_name(:auth_token)
    setting.update(value: token)
  end
end
