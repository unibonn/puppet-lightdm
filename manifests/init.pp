# Class: lightdm
#
# This module manages lightdm
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class lightdm (
	$package_name			= $lightdm::params::package_name,
	$config_file			= $lightdm::params::config_file,
	$config_template		= $lightdm::params::config_template,
	$allow_guest			= $lightdm::params::allow_guest,
	$display_setup_script		= $lightdm::params::display_setup_script,
  
	$greeter_package_name		= $lightdm::params::greeter_package_name,
	$greeter_config_file		= $lightdm::params::greeter_config_file,
	$greeter_config_template	= $lightdm::params::greeter_config_template,
	$greeter_hide_users		= $lightdm::params::greeter_hide_users,
	$greeter_allow_guest		= $lightdm::params::greeter_allow_guest,
	$greeter_background		= $lightdm::params::greeter_background,
	$greeter_theme_name		= $lightdm::params::greeter_theme_name,
	$greeter_icon_theme_name	= $lightdm::params::greeter_icon_theme_name,
	$greeter_font_name		= $lightdm::params::greeter_font_name,
	$greeter_show_clock		= $lightdm::params::greeter_show_clock,
  
) inherits lightdm::params {
  
	validate_array($package_name)
	validate_string($config_file)
	validate_string($config_template)
	validate_bool($allow_guest)
	validate_array($greeter_package_name)
	validate_string($greeter_config_file)
	validate_string($greeter_config_template)
	validate_bool($greeter_hide_users)
	validate_bool($greeter_allow_guest)
  
	anchor { 'lightdm::begin': } ->
	class { '::lightdm::install': } ~>
	class { '::lightdm::config': } ~>
	class { '::lightdm::service': } ->
	anchor { 'lightdm::end': }
}
