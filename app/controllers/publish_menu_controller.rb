class PublishMenuController < ApplicationController
  authorize_resource :class => PublishMenuController

  def invoke
    @menu = Menu.find(params[:id])

    begin
      form_uid = CreateForm.new(@menu).form_uid
      CreateWebhook.new(form_uid)
      @menu.update(state: 'published', form: form_uid)
      flash[:success] = "Menu '#{@menu.week_description}' published"
    rescue => err
      puts "Error publishing the menu. Error: #{err}"
      flash[:danger] = "Error publishing menu '#{@menu.week_description}'"
    end
    redirect_to menus_path
  end
end
