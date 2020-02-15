Rails.application.routes.draw do
  get("/", { :controller => "users", :action => "index"  })

  # User routes

  # CREATE
  get("/insert_user_record", {:controller => "users", :action => "create", })

  # READ
  get("/users", {:controller => "users", :action => "index" })
  get("/users/:the_username", {:controller => "users", :action => "show" })
  get("/users/:the_username/own_photos", {:controller => "users", :action => "own_photos" })
  get("/users/:the_username/liked_photos", {:controller => "users", :action => "liked_photos" })
  get("/users/:the_username/feed", {:controller => "users", :action => "feed" })
  get("/users/:the_username/discover", {:controller => "users", :action => "discover" })


  # UPDATE
  get("/update_user/:the_user_id", {:controller => "users", :action => "update", })

  # DELETE
  get("/delete_user/:the_user_id", {:controller => "users", :action => "destroy" })



  # Photo routes

  # CREATE
  get("/insert_photo_record", { :controller => "photos", :action => "create", })

  # READ
  get("/photos", { :controller => "photos", :action => "index" })

  get("/photos/:the_photo_id", { :controller => "photos", :action => "show" })

  get("/photos/:the_photo_id/comments", { :controller => "photos", :action => "comments" })
  get("/photos/:the_photo_id/likes", { :controller => "photos", :action => "likes" })
  get("/photos/:the_photo_id/fans", { :controller => "photos", :action => "fans" })

  # UPDATE
  get("/update_photo/:the_photo_id", { :controller => "photos", :action => "update", })

  # DELETE
  get("/delete_photo/:the_photo_id", { :controller => "photos", :action => "destroy" })


  # Like routes

  # CREATE
  get("/insert_like_record", {:controller => "likes", :action => "create", })

  # READ
  get("/likes", {:controller => "likes", :action => "index" })
  get("/likes/:the_like_id", {:controller => "likes", :action => "show" })

  # UPDATE
  get("/update_like/:the_like_id", {:controller => "likes", :action => "update" })

  # DELETE
  get("/delete_like/:the_like_id", {:controller => "likes", :action => "destroy" })

  # Comment routes

  # CREATE
  get("/insert_comment_record", { :controller => "comments", :action => "create", })

  # READ
  get("/comments", { :controller => "comments", :action => "index" })
  get("/comments/:the_comment_id", { :controller => "comments", :action => "show" })

  # UPDATE
  get("/update_comment/:the_comment_id", { :controller => "comments", :action => "update" })

  # DELETE

  get("/delete_comment/:the_comment_id", { :controller => "comments", :action => "destroy" })

  # ===============Route for Admin Dashboard========================
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
