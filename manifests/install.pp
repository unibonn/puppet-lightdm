class lightdm::install inherits lightdm {
	package { $lightdm::package_name:
		ensure => $lightdm::package_ensure;
	}
	package { $lightdm::greeter_package_name:
		ensure => $lightdm::package_ensure; 
	}
}
