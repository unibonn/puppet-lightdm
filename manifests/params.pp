class lightdm::params {
	$config_template		= 'lightdm/lightdm.conf.erb'
	$allow_guest			= false
	$display_setup_script		= "setxkbmap us"
	$greeter			= 'gtk'
	$greeter_hide_users		= false
	$greeter_allow_guest		= true
	$greeter_background		= "#000000"
	$greeter_theme_name		= 'Ambiance'
	$greeter_icon_theme_name	= 'LoginIcons'
	$greeter_font_name		= 'Ubuntu 11'
	$greeter_show_clock		= false
	
	case $::osfamily {
		'Debian': {
			$package_name			= ['lightdm']
			$config_file			= '/etc/lightdm/lightdm.conf'
			$default_display_manager	= '/usr/sbin/lightdm'
			case $greeter {
				'gtk': {
					$greeter_package_name		= ['lightdm-gtk-greeter']
					$greeter_config_file		= '/etc/lightdm/lightdm-gtk-greeter.conf'
					$greeter_config_template 	= 'lightdm/lightdm-gtk-greeter.conf.erb'
				}
				default: {
					fail("The ${module_name} module does not support the $greeter greeter.")
				}
			} 
		}
		default: {
			fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
		}
	}
}
