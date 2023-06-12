class User < ActiveRecord::Base
  # ... your other model code ...
  def authenticate_by_email(email)
    # Perform your custom authentication logic here
    # For example, compare the email with the stored email in the user record
    # Assuming you have an 'email' attribute in the User model
    self.email == email
  end
end







