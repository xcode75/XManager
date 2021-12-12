ALTER TABLE `servers` CHANGE `connector` `tfo` TINYINT(1) NOT NULL DEFAULT '0';
ALTER TABLE `user` DROP `onlineips`;