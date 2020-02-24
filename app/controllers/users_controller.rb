class UsersController < ApplicationController
  def index
    @users = User.all.order({ :username => :asc })

    render({ :template => "users/index.html" })
  end

  def show
    the_username = params.fetch("the_username")
    @user = User.where({ :username => the_username }).at(0)

    render({ :template => "users/show.html.erb" })
  end

  def create
    user = User.new

    user.username = params.fetch("input_username")
    user.password = params.fetch("input_password")
    user.password_confirmation = params.fetch("password_confirm")
    
    save_status = user.save

    if save_status == true
    session.store(:user_id, user.id)

    redirect_to("/users/#{user.username}", {:notice => "Welcome, " + user.username + "!"})
    else
    redirect_to("/user_sign_up", {:alert => user.errors.full_messages.to_sentence})
    end 
    
  end

def authenticate
  #get username from params
  #get password from params
  #get record from the db matching username
  # if there's no record redirect to sign in form
  # if record, check password matches, if not redirect back to sign in
  # if so set session cookie and redirect to homepage
  un = params.fetch("input_username")
  pw = params.fetch("input_password")

  user = User.where({:username => un}).at(0)
  if user == nil
  redirect_to("/user_sign_in", {:alert => "No one by that name round these parts!"})
  else 
    if user.authenticate(pw) 
    session.store(:user_id, user.id)
    redirect_to("/", {:notice => "Sign in succesful. Welcome " + user.username + "!" })
    else
    redirect_to("/user_sign_in", {:alert => "Incorrect password"})  
    end 
  end
end

  def sign_in_form

  render({:template => "/users/sign_in_form.html.erb"})
  end


  def sign_out
  reset_session
  redirect_to("/", {:notice => "See ya later!"})
  end

  def update
    the_id = params.fetch("the_user_id")
    user = User.where({ :id => the_id }).at(0)


    user.username = params.fetch("input_username")

    user.save
    
    redirect_to("/users/#{user.username}")
  end

  def destroy
    username = params.fetch("the_username")
    user = User.where({ :username => username }).at(0)

    user.destroy

    redirect_to("/users")
  end

  def new_registration_form
  
   
  render({:template => "/users/signup_form.html.erb"})
  end

end
