Rails.application.routes.draw do

  get("/", { :controller => "users", :action => "index" })
  get("/sign_in", { :controller => "users", :action => "sign_in" })
  get("/sign_up", { :controller => "users", :action => "registration_form" })
  get("/sign_out", { :controller => "users", :action => "remove_cookies" })

  post("/verify_credentials", { :controller => "users", :action => "add_cookie" })

  # User routes

  # CREATE
  post("/insert_user_record", {:controller => "users", :action => "create" })

  # READ
  get("/users", {:controller => "users", :action => "index"})
  get("/users/:the_username", {:controller => "users", :action => "show"})

  # UPDATE
  post("/update_user/:the_user_id", {:controller => "users", :action => "update" })

  # DELETE
  get("/delete_user/:the_user_id", {:controller => "users", :action => "destroy"})

  # Photo routes

  # CREATE
  post("/insert_photo_record", { :controller => "photos", :action => "create" })

  # READ
  get("/photos", { :controller => "photos", :action => "index"})

  get("/photos/:the_photo_id", { :controller => "photos", :action => "show"})

  # UPDATE
  post("/update_photo/:the_photo_id", { :controller => "photos", :action => "update" })

  # DELETE
  get("/delete_photo/:the_photo_id", { :controller => "photos", :action => "destroy"})

  # Comment routes

  # CREATE
  post("/insert_comment_record", { :controller => "comments", :action => "create" })

  # DELETE

  get("/delete_comment/:the_comment_id", { :controller => "comments", :action => "destroy"})

  # ===============Route for Admin Dashboard========================
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
