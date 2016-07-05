class lightdm::service inherits lightdm {
	service { 'lightdm':
		ensure => running,
		enable => true,
	}
}
