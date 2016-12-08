class InitialTables < ActiveRecord::Migration[5.0]
  def change

  	create_table :tenants do |t|
  		t.string     :url
  		t.boolean    :is_active, default: true
      t.timestamps
  	end

    add_index :tenants, :url, unique: true

  	create_table :customers do |t|
  		t.integer :tenant_id
      t.string :customer_code
      t.string :name
      t.text   :address
      t.string :phone
      t.timestamps
  	end

    add_index :customers, :customer_code, unique: true

  	create_table :products do |t|
  		t.integer :tenant_id
      t.string :product_code, unique: true
      t.string :name
      t.string :unit
      t.decimal :price, precision: 12, scale: 2
      t.float :profit
      t.float :stock, precision: 12, scale: 2
      t.decimal :price_sell
      t.timestamps
  	end

  	create_table :sales do |t|
  		t.integer :tenant_id
  		t.string   :transaction_code, unique: true
  		t.datetime :date
  		t.integer  :suplier_id
  		t.integer  :created_by
  		t.decimal  :total_amount, precision: 12, scale: 2
      t.timestamps
  	end

  	create_table :purchases do |t|
  		t.integer :tenant_id
  		t.string   :transaction_code, unique: true
  		t.datetime :date
  		t.integer  :suplier_id
  		t.integer  :created_by
  		t.decimal  :total_amount, precision: 12, scale: 2
      t.timestamps
  	end

  	create_table :product_items do |t|
  		t.integer :tenant_id
  		t.integer :transactionable_id
  		t.string  :transactionable_type
  		t.integer :product_id
  		t.decimal :price, precision: 12, scale: 2
  		t.decimal :price_sell, precision: 12, scale: 2
  		t.float   :total
  		t.timestamps
  	end

  	create_table :supliers do |t|
      t.string :suplier_code, unique: true
      t.string :name
      t.text   :address
      t.string :city
      t.string :state
      t.string :phone
      t.string :fax
      t.string :contact
      t.timestamps
  	end
  end
end