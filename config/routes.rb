HubriseApp::Engine.routes.draw do
  namespace :hubrise_oauth, controller: "/hubrise_app/override/oauth" do
    get :connect_callback
    get :login_callback
    get :authorize_callback
  end

  namespace :hubrise_callback, controller: "/hubrise_app/override/callback" do
    post :event
    get  :disconnect
  end
end
