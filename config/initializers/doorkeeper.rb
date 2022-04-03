Doorkeeper.configure do
  # Change the ORM that doorkeeper will use (needs plugins)
  orm :active_record

  resource_owner_authenticator do
    raise "Please configure doorkeeper resource_owner_authenticator block located in #{__FILE__}"
    # Put your resource owner authentication logic here.
    # Example implementation:
    #   User.find_by(id: session[:user_id]) || redirect_to(new_user_session_url)
  end

end

