class CreatePasses < ActiveRecord::Migration
  def change
    enable_extension 'uuid-ossp'

    create_table :passes, id: :uuid do |t|
      t.string :email, null: false
      t.string :billing_ref, null: false
      t.integer :seconds_of_use, default: 0, null: false
      t.column :valid_until, 'timestamptz', null: false
      t.column :created_at, 'timestamptz', null: false
      t.column :updated_at, 'timestamptz', null: false
    end
  end
end
