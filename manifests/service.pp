class lightdm::service inherits lightdm {
	service { 'lightdm':
		ensure => $lightdm::service_ensure,
		enable => $lightdm::service_enable,
	}
}
