class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :commentable, polymorphic: true
      t.references :user, null: false, type: :string, index: true
      t.text :body

      t.timestamps
    end
  end
end
