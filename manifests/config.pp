class lightdm::config inherits lightdm {
	file { $lightdm::config_file:
		ensure	=> file,
		owner	=> 'root',
		group	=> 'root',
		mode	=> '0644',
		content	=> template($lightdm::config_template),
	}
  
	file { $lightdm::greeter_config_file:
		ensure	=> file,
		owner	=> 'root',
		group	=> 'root',
		mode	=> '0644',
		content	=> template($lightdm::greeter_config_template),
	}

	file { '/etc/X11/default-display-manager':
		ensure	=> file,
		owner	=> 'root',
		group	=> 'root',
		mode	=> '0644',
		content	=> $lightdm::default_display_manager,
	}
}
