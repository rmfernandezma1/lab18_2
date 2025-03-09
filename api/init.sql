-- Create the user and database
CREATE USER basic3tier_user WITH PASSWORD 'basic3tier_password';
CREATE DATABASE basic3tier;
GRANT ALL PRIVILEGES ON DATABASE basic3tier TO basic3tier_user;

-- Connect to the database
\c basic3tier

-- Grant schema privileges
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO basic3tier_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON SEQUENCES TO basic3tier_user;
GRANT ALL ON SCHEMA public TO basic3tier_user; 