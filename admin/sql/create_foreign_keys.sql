BEGIN;

ALTER TABLE token
  ADD CONSTRAINT token_owner_id_fkey FOREIGN KEY (owner_id)
  REFERENCES "user" (id) MATCH SIMPLE
  ON UPDATE CASCADE ON DELETE SET NULL;

ALTER TABLE "user"
  ADD CONSTRAINT user_tier_id_fkey FOREIGN KEY (tier_id)
  REFERENCES tier (id) MATCH SIMPLE
  ON UPDATE CASCADE ON DELETE SET NULL;

ALTER TABLE token_log
  ADD CONSTRAINT token_log_token_value_fkey FOREIGN KEY (token_value)
  REFERENCES token (value) MATCH SIMPLE
  ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE token_log
  ADD CONSTRAINT token_log_user_id_fkey FOREIGN KEY (user_id)
  REFERENCES "user" (id) MATCH SIMPLE
  ON UPDATE CASCADE ON DELETE SET NULL;

ALTER TABLE access_log
  ADD CONSTRAINT access_log_token_fkey FOREIGN KEY (token)
  REFERENCES token (value) MATCH SIMPLE
  ON UPDATE NO ACTION ON DELETE NO ACTION;

COMMIT;