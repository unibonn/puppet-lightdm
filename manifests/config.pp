class lightdm::config inherits lightdm {
	file { $lightdm::config_file:
		ensure	=> file,
		owner	=> 0,
		group	=> 0,
		mode	=> '0644',
		content	=> template($lightdm::config_template),
	}
  
	file { $lightdm::greeter_config_file:
		ensure	=> file,
		owner	=> 0,
		group	=> 0,
		mode	=> '0644',
		content	=> template($lightdm::greeter_config_template),
	}
}
