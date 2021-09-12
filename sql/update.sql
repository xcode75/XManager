INSERT INTO `config` (`name`, `value`) VALUES
('version', 'v3.2'),
('latesversion', 'v3.2');
ALTER TABLE `orders` ADD `extra` DECIMAL(12,2) NOT NULL DEFAULT '0.00' AFTER `pending`;
