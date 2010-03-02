class CreateNavigationTypes < ActiveRecord::Migration
  def self.up
    create_table :navigation_types do |t|
      t.string :name
      t.timestamps
    end
    add_column :pages, :navigationTypeId, :integer
    
     NavigationType.create :name => 'Main'
     NavigationType.create :name => 'Help'
  end

  def self.down
    drop_table :navigation_types
    remove_column :pages, :navigationTypeId
  end
end
