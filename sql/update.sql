ALTER TABLE `user` ADD `currency` VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '';
ALTER TABLE `temp_order` CHANGE `order_id` `order_id` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
ALTER TABLE `orders` CHANGE `order_id` `order_id` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL;
ALTER TABLE `temp_order` ADD `pay_id` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL;
INSERT INTO `config` (`name`, `value`) VALUES('template', 'default');