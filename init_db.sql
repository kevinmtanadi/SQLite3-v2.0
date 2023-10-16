-- Simple file to init the database with sample data --


-- Create a table with trains
CREATE TABLE IF NOT EXISTS users (
  user_id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT NOT NULL,
  password TEXT NOT NULL,
  salt TEXT NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS product (
  product_id VARCHAR(32) PRIMARY KEY,
  product_name VARCHAR(255) NOT NULL,
  weight float NOT NULL
);

CREATE TABLE IF NOT EXISTS product_stock (
  product_stock_id TEXT PRIMARY KEY,
  product_id TEXT NOT NULL,
  buy_price INTEGER NOT NULL,
  buy_at DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
  note TEXT,
  status TEXT NOT NULL DEFAULT 'available',
  FOREIGN KEY (product_id) REFERENCES product(product_id)
);

CREATE TABLE IF NOT EXISTS transactions(
  transaction_id INTEGER PRIMARY KEY AUTOINCREMENT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS cart_item(
  cart_item_id INTEGER PRIMARY KEY AUTOINCREMENT,
  product_stock_id VARCHAR(32) NOT NULL,
  FOREIGN KEY (product_stock_id) REFERENCES product_stock(product_stock_id)
);

CREATE TABLE IF NOT EXISTS transaction_purchase(
  transaction_purchase_id INTEGER PRIMARY KEY AUTOINCREMENT,
  transaction_id INTEGER NOT NULL,
  product_id VARCHAR(32) NOT NULL,
  product_stock_id VARCHAR(32) NOT NULL,
  product_name VARCHAR(255),
  buy_price INTEGER NOT NULL,
  FOREIGN KEY (transaction_id) REFERENCES transactions(transaction_id)
);