ALTER TABLE `user` ADD `notice_status` INT(10) NOT NULL DEFAULT '0' AFTER `ref_by`;
ALTER TABLE `user` ADD `notice_id` TEXT NULL DEFAULT NULL AFTER `notice_status`;
