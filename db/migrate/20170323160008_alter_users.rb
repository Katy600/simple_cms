# class AlterUsers < ActiveRecord::Migration[5.0]
#   def up
#     rename_table("users", "admin_user")
#     add_column("admin_user", "username", :string, :limit => 25,
#     :after => "email")
#     change_column("admin_user", "email", :string, :limit => 100)
#     rename_column("admin_user", "password", "hashed_password")
#     puts "*** Adding an index ***"
#     add_index("admin_user", "username")
#   end
#
#   def down
#     remove_index("admin_user", "username")
#     rename_column("admin_user","hashed_password", "password" )
#     rename_column("admin_user", "password", "hashed_password")
#     change_column("admin_user", "email", :string, :default => '', :null => false)
#     remove_column("admin_user", "username")
#     rename_table("admin_user", "users")
#   end
# end
