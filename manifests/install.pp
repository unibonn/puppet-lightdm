class lightdm::install inherits lightdm {
	package { $lightdm::package_name:
		ensure => installed;
	}
	package { $lightdm::greeter_package_name:
		ensure => installed; 
	}
}
