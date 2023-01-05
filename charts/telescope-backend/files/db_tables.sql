-- 
-- DROP TABLE IF EXISTS domain;
CREATE TABLE IF NOT EXISTS domain (
  id SERIAL PRIMARY KEY,
  description varchar(128),
  created_at TIMESTAMP DEFAULT NOW()
);
INSERT INTO domain(description) SELECT 'Secure Infrastructure' WHERE NOT EXISTS (SELECT 1 FROM domain where description = 'Secure Infrastructure');
INSERT INTO domain(description) SELECT 'Secure Data' WHERE NOT EXISTS (SELECT 1 FROM domain where description = 'Secure Data');
INSERT INTO domain(description) SELECT 'Secure Code' WHERE NOT EXISTS (SELECT 1 FROM domain where description = 'Secure Code');
INSERT INTO domain(description) SELECT 'Secure Integrations' WHERE NOT EXISTS (SELECT 1 FROM domain where description = 'Secure Integrations');
INSERT INTO domain(description) SELECT 'Secure Monitoring & Logging' WHERE NOT EXISTS (SELECT 1 FROM domain where description = 'Secure Monitoring & Logging');

-- 
-- DROP TABLE capability;

CREATE TABLE IF NOT EXISTS capability (
  id SERIAL PRIMARY KEY,
  domain_id int,
  flag_id int,
  description varchar(128),
  created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO capability(domain_id, description, flag_id) SELECT 1, 'Platform Hardening', 1 WHERE NOT EXISTS (SELECT 1 FROM capability where domain_id = 1 AND description = 'Secure Infrastructure' AND flag_id = 1);
INSERT INTO capability(domain_id, description, flag_id) SELECT 1, 'Container Protection',1 WHERE NOT EXISTS (SELECT 1 FROM capability where domain_id = 1 AND description = 'Container Protection' AND flag_id = 1);
INSERT INTO capability(domain_id, description, flag_id) SELECT 1, 'Secure Images', 2 WHERE NOT EXISTS (SELECT 1 FROM capability where domain_id = 1 AND description = 'Secure Images' AND flag_id = 2);
INSERT INTO capability(domain_id, description, flag_id) SELECT 2, 'Classification', 1 WHERE NOT EXISTS (SELECT 1 FROM capability where domain_id = 2 AND description = 'Classification' AND flag_id = 1);
INSERT INTO capability(domain_id, description, flag_id) SELECT 2, 'Vulnerability Scanning', 2 WHERE NOT EXISTS (SELECT 1 FROM capability where domain_id = 2 AND description = 'Vulnerability Scanning' AND flag_id = 2);
INSERT INTO capability(domain_id, description, flag_id) SELECT 2, 'Encryption', 2 WHERE NOT EXISTS (SELECT 1 FROM capability where domain_id = 2 AND description = 'Encryption' AND flag_id = 2);
INSERT INTO capability(domain_id, description, flag_id) SELECT 2, 'Loss Prevention', 1 WHERE NOT EXISTS (SELECT 1 FROM capability where domain_id = 2 AND description = 'Loss Prevention' AND flag_id = 1);
INSERT INTO capability(domain_id, description, flag_id) SELECT 3, 'Static Code Analysis', 1 WHERE NOT EXISTS (SELECT 1 FROM capability where domain_id = 2 AND description = 'Static Code Analysis' AND flag_id = 1);
INSERT INTO capability(domain_id, description, flag_id) SELECT 3, 'Dynamic Code Analysis', 1 WHERE NOT EXISTS (SELECT 1 FROM capability where domain_id = 2 AND description = 'Dynamic Code Analysis' AND flag_id = 1);
INSERT INTO capability(domain_id, description, flag_id) SELECT 3, 'Vulnerability Assessment', 1 WHERE NOT EXISTS (SELECT 1 FROM capability where domain_id = 3 AND description = 'Vulnerability Assessment' AND flag_id = 1);
INSERT INTO capability(domain_id, description, flag_id) SELECT 4, 'Authentication', 2 WHERE NOT EXISTS (SELECT 1 FROM capability where domain_id = 4 AND description = 'Authentication' AND flag_id = 2);
INSERT INTO capability(domain_id, description, flag_id) SELECT 4, 'Traffic Analysis', 2 WHERE NOT EXISTS (SELECT 1 FROM capability where domain_id = 4 AND description = 'Traffic Analysis' AND flag_id = 2);
INSERT INTO capability(domain_id, description, flag_id) SELECT 4, 'Exposure Protection', 1 WHERE NOT EXISTS (SELECT 1 FROM capability where domain_id = 4 AND description = 'Exposure Protection' AND flag_id = 1);
INSERT INTO capability(domain_id, description, flag_id) SELECT 4, 'Secure Protocols', 1 WHERE NOT EXISTS (SELECT 1 FROM capability where domain_id = 4 AND description = 'Secure Protocols' AND flag_id = 1);
INSERT INTO capability(domain_id, description, flag_id) SELECT 5, 'Access Monitoring', 1 WHERE NOT EXISTS (SELECT 1 FROM capability where domain_id = 5 AND description = 'Access Monitoring' AND flag_id = 1);
INSERT INTO capability(domain_id, description, flag_id) SELECT 5, 'Log Centralization', 1 WHERE NOT EXISTS (SELECT 1 FROM capability where domain_id = 5 AND description = 'Log Centralization' AND flag_id = 1);

--
-- DROP TABLE IF EXISTS flag;

CREATE TABLE IF NOT EXISTS flag (
  id SERIAL PRIMARY KEY,
  description varchar(128),
  created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO flag(description) SELECT 'red' WHERE NOT EXISTS (SELECT 1 FROM flag where description = 'red');
INSERT INTO flag(description) SELECT 'green' WHERE NOT EXISTS (SELECT 1 FROM flag where description = 'green');


