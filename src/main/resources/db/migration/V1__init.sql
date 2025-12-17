-- userinfo テーブル作成
CREATE TABLE IF NOT EXISTS userinfo (
  id BIGSERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  address VARCHAR(255),
  phone VARCHAR(50),
  update_date TIMESTAMP NOT NULL,
  create_date TIMESTAMP NOT NULL,
  delete_date TIMESTAMP
);