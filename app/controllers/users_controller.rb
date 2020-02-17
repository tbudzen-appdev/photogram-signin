class UsersController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:sign_in, :add_cookie, :registration_form, :create]

  def sign_in
    render({ :template => "users/sign_in.html.erb"})
  end
  
  def registration_form
    render({ :template => "users/sign_up.html.erb"})
  end

  def add_cookie
    user = User.where({ :username => params.fetch("qs_username") }).at(0)

    if user != nil && user.authenticate(params.fetch("qs_password"))
      session[:user_id] = user.id

      redirect_to("/", { :notice => "Signed in successfully." })
    else
      redirect_to("/sign_in", { :alert => "Something went wrong. Please try again." })
    end
  end

  def remove_cookies
    reset_session

    redirect_to("/", { :notice => "Signed out successfully." })
  end

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
    user.password_confirmation = params.fetch("input_password_confirmation")

    user.save
    session.store(:user_id, user.id)

    redirect_to("/users/#{user.username}")
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

end
