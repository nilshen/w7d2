class ChangeColName < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :passwor_digest, :password_digest
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword") :users, :c, :column_type, :column_options
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
