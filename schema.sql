CREATE DATABASE bias_fairness_db;
USE bias_fairness_db;

-- TABLE 1: Users
CREATE TABLE users (
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  age INT,
  email VARCHAR(100)
);

-- TABLE 2: Demographics
CREATE TABLE demographics (
  demo_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  gender VARCHAR(20),
  race VARCHAR(50),
  region VARCHAR(50),
  education VARCHAR(50),
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- TABLE 3: Scores
CREATE TABLE scores (
  score_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  credit_score INT,
  performance_score FLOAT,
  risk_score FLOAT,
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- TABLE 4: Decisions
CREATE TABLE decisions (
  decision_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  algorithm_name VARCHAR(100),
  predicted_outcome INT,
  confidence_score FLOAT,
  decision_date DATE,
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- TABLE 5: Outcomes
CREATE TABLE outcomes (
  outcome_id INT PRIMARY KEY AUTO_INCREMENT,
  decision_id INT,
  actual_outcome INT,
  is_correct INT,
  FOREIGN KEY (decision_id) REFERENCES decisions(decision_id)
);

-- TABLE 6: Categories
CREATE TABLE categories (
  category_id INT PRIMARY KEY AUTO_INCREMENT,
  algorithm_name VARCHAR(100),
  category_type VARCHAR(50),
  version VARCHAR(20),
  deployed_date DATE
);

-- BONUS TABLE: Audit Logs
CREATE TABLE audit_logs (
  log_id INT PRIMARY KEY AUTO_INCREMENT,
  action VARCHAR(50),
  table_name VARCHAR(50),
  performed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- TRIGGER
CREATE TRIGGER log_decisions
AFTER INSERT ON decisions
FOR EACH ROW
INSERT INTO audit_logs(action, table_name)
VALUES('INSERT', 'decisions');