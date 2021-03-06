USE kloxo;

DROP TABLE IF EXISTS `watchdog`;
CREATE TABLE IF NOT EXISTS `watchdog` (
  `nname` varchar(255) NOT NULL,
  `parent_clname` varchar(255) DEFAULT NULL,
  `parent_cmlist` text,
  `servicename` varchar(255) DEFAULT NULL,
  `syncserver` varchar(255) DEFAULT NULL,
  `port` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `added_by_system` varchar(255) DEFAULT NULL,
  `oldsyncserver` varchar(255) DEFAULT NULL,
  `olddeleteflag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`nname`),
  KEY `parent_clname_watchdog` (`parent_clname`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `watchdog` (`nname`, `parent_clname`, `parent_cmlist`, `servicename`, `syncserver`, `port`, `action`, `status`, `added_by_system`, `oldsyncserver`, `olddeleteflag`) VALUES
('dns___localhost', 'pserver-localhost', '', 'dns', 'localhost', '53', '__driver_dns', 'on', 'on', '', ''),
('web___localhost', 'pserver-localhost', '', 'web', 'localhost', '80', '__driver_web', 'on', 'on', '', ''),
('mail___localhost', 'pserver-localhost', '', 'mail', 'localhost', '25', '__driver_qmail', 'on', 'on', '', ''),
('mysql___localhost', 'pserver-localhost', '', 'mysql', 'localhost', '3306||/var/lib/mysql/mysql.sock', '__driver_mysql', 'on', 'on', '', ''),
('ftp___localhost', 'pserver-localhost', '', 'ftp', 'localhost', '21', '__driver_xinetd', 'on', 'on', '', '');

DROP TABLE IF EXISTS `service`;
CREATE TABLE IF NOT EXISTS `service` (
  `nname` varchar(255) NOT NULL,
  `parent_clname` varchar(255) DEFAULT NULL,
  `parent_cmlist` text,
  `servicename` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `grepstring` varchar(255) DEFAULT NULL,
  `syncserver` varchar(255) DEFAULT NULL,
  `oldsyncserver` varchar(255) DEFAULT NULL,
  `olddeleteflag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`nname`),
  KEY `parent_clname_service` (`parent_clname`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `service` (`nname`, `parent_clname`, `parent_cmlist`, `servicename`, `description`, `grepstring`, `syncserver`, `oldsyncserver`, `olddeleteflag`) VALUES
('qmail___localhost', 'pserver-localhost', '', 'qmail', 'Qmail-toaster Mail Server', 'qmail', 'localhost', '', ''),
('named___localhost', 'pserver-localhost', '', 'named', 'Bind Dns Server', 'named', 'localhost', '', ''),
('djbdns___localhost', 'pserver-localhost', '', 'djbdns', 'DjbDns Dns Server', 'tinydns', 'localhost', '', ''),
('pdns___localhost', 'pserver-localhost', '', 'pdns', 'PowerDNS Dns Server', 'pdns', 'localhost', '', ''),
('nsd___localhost', 'pserver-localhost', '', 'nsd', 'NSD Dns Server', 'nsd', 'localhost', '', ''),
('mydns___localhost', 'pserver-localhost', '', 'mydns', 'MyDNS Dns Server', 'mydns', 'localhost', '', ''),
('yadifa___localhost', 'pserver-localhost', '', 'yadifad', 'YADIFA Dns Server', 'yadifad', 'localhost', '', ''),
('php-fpm___localhost', 'pserver-localhost', '', 'php-fpm', 'Php Fastcgi Process Manager', 'php-fpm', 'localhost', '', ''),
('httpd___localhost', 'pserver-localhost', '', 'httpd', 'Apache Web Server', 'httpd', 'localhost', '', ''),
('lighttpd___localhost', 'pserver-localhost', '', 'lighttpd', 'Lighttpd Web Server', 'lighttpd', 'localhost', '', ''),
('nginx___localhost', 'pserver-localhost', '', 'nginx', 'Nginx Web Server', 'nginx', 'localhost', '', ''),
('hiawatha___localhost', 'pserver-localhost', '', 'hiawatha', 'Hiawatha Web Server (use by Kloxo-MR)', 'hiawatha', 'localhost', '', ''),
('varnish___localhost', 'pserver-localhost', '', 'varnish', 'Varnish Web Cache', 'varnish', 'localhost', '', ''),
('squid___localhost', 'pserver-localhost', '', 'squid', 'Squid Web Cache', 'squid', 'localhost', '', ''),
('trafficserver___localhost', 'pserver-localhost', '', 'trafficserver', 'Apache Traffic Server Web Cache', 'trafficserver', 'localhost', '', ''),
('mysql___localhost', 'pserver-localhost', '', 'mysqld', 'MySQL Database', 'mysqld', 'localhost', '', ''),
('mariadb___localhost', 'pserver-localhost', '', 'mysql', 'MariaDB Database', 'mysql', 'localhost', '', ''),
('iptables___localhost', 'pserver-localhost', '', 'iptables', 'IPTables Firewall', 'iptables', 'localhost', '', '');

CREATE TABLE IF NOT EXISTS `jailed` (
  `nname` varchar(255) NOT NULL,
  `parent_clname` varchar(255) DEFAULT NULL,
  `parent_cmlist` text,
  `enable_jailed` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`nname`),
  KEY `parent_clname_jailed` (`parent_clname`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `dnsslave` (
  `nname` varchar(255) NOT NULL,
  `parent_clname` varchar(255) DEFAULT NULL,
  `parent_cmlist` text,
  `master_ip` varchar(255) DEFAULT NULL,
  `syncserver` varchar(255) DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`nname`),
  KEY `parent_clname_dnsslave` (`parent_clname`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

ALTER TABLE `client` CHANGE COLUMN `priv_q_frontpage_flag` `priv_q_totalinode_flag` VARCHAR(255) DEFAULT NULL;
ALTER TABLE `client` CHANGE COLUMN `used_q_frontpage_flag` `used_q_totalinode_flag` VARCHAR(255) DEFAULT NULL;
