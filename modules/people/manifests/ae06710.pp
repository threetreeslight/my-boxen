class people::ae06710 {
  #
  # osx
  #
  # general
  include osx::global::tap_to_click
  # Finder
  include osx::finder::unhide_library
  include osx::finder::show_hidden_files
  # Dock
  include osx::dock::2d
  include osx::dock::autohide
  class osx::dock::kill_dashbord{
    include osx::dock
    boxen::osx_defaults { 'kill dashbord':
      user   => $::boxen_user,
      domain => 'com.apple.dashboard',
      key    => 'mcx-disabled',
      value  => YES,
      notify => Exec['killall Dock'];
    }
  }
  include osx::dock::kill_dashbord
  # Universal Access
  include osx::universal_access::ctrl_mod_zoom
  include osx::universal_access::enable_scrollwheel_zoom
  # Miscellaneous
  include osx::no_network_dsstores # disable creation of .DS_Store files on network shares
  include osx::software_update # download and install software updates
  include osx::keyboard::capslock_to_control

  #
  # lib
  #
  homebrew::tap { 'homebrew/binary': }
  package {
    [
      # readline install by mloberg/puppet-python
      # 'readline',                   # use for ruby compile
      'pcre',                       # perl regular expression ( need compile php )
      'libpng',                     # png lib ( need compile php )
      'coreutils',                  # change mac command to like GNU Linux
      'pstree',                     # like linux ps -f option cmd
      'wget',                       #
      'qt',                         # UI toolkit ( need capibara-webkit )
      'tree',                       # linux tree cmd
      'z',                          # shortcut change dir
      'zsh-completions',            # shortcut change dir
      'resty',                      # curl wrapper cli
      'vim',                        # mac preinstalled vim is old X(
      'pt',                         # the_platinum_searcher
      'proctools',                  # kill by process name. like $ pkill firefox
      'jq',                         # json perser pipeline
      'ctags',                      # vim compel
      'putty',                      # use convert ppk key to OpenSSH format
      'tmux',                       # terminal session
      'reattach-to-user-namespace', # use tmux to clipbord
      'tig',                        # git cui client
      'sshrc',                      # directive ssh setting
      'imagemagick',                # convert, Edit, And Compose Images
      'graphviz',                   # graph generator (use for rails-erd)
      'ffmpeg',
      'mysql',
      'packer'                      # vagrant box maker
    ]:
  }

  # include java
  # python::version { '2.7.6': }
  # $python_version = '2.7.6'
  # python::package { "virtualenv for ${python_version}":
  #   package => 'virtualenv',
  #   python  => $python_version,
  # }
  # python::package { "virtualenvwrapper ${python_version}":
  #   package => 'virtualenvwrapper',
  #   python  => $python_version,
  # }
  # python::package { "percol for ${python_version}":
  #   package => 'percol',
  #   python  => $python_version,
  # }
  # python::package { "stellar for ${python_version}":
  #   package => 'stellar',
  #   python  => $python_version,
  # }
  # python::package { "awscli for ${python_version}":
  #   package => 'awscli',
  #   python  => $python_version,
  # }
  # class { 'python::global': version => '2.7.6' }
  # include php::5_4_17
  # include php::composer
  # include php::fpm::5_4_17
  # php::extension::pgsql { 'pgsql for 5.4.17':
  #   php => '5.4.17'
  # }
  # php::extension::pdo_dblib { 'pdo_dblib for 5.4.17':
  #   php => '5.4.17'
  # }
  # php::extension::apc { 'apc for 5.4.17':
  #   php => '5.4.17'
  # }
  # php::extension::xdebug { 'xdebug for 5.4.17':
  #   php => '5.4.17'
  # }
  include postgresql
  include redis
  include zsh
  phantomjs::version { '1.9.2': }
  include heroku

  # ruby
  # ruby_gem { 'git-issue for all ruby versions':
  #   gem          => 'git-issue',
  #   ruby_version => '*'
  # }
  ruby_gem { 'rubocop for all ruby versions':
    gem          => 'rubocop',
    ruby_version => '*'
  }
  ruby_gem { 'tmuxinator for all ruby versions':
    gem          => 'tmuxinator',
    ruby_version => '*'
  }
  # # rbenv plugins
  # repository { '/opt/boxen/rbenv/plugins/gem-src':
  #   source  => 'amatsuda/gem-src'
  # }

  #
  # Client application
  #
  # terminal
  package { 'iTerm':
    source   => "http://www.iterm2.com/downloads/beta/iTerm2-1_0_0_20140629.zip",
    provider => 'compressed_app'
  }

  # DB
  $sequel_version='1.0.2'
  package { "Sequel-Pro-${sequel_version}":
    provider => 'appdmg',
    source   => "http://sequel-pro.googlecode.com/files/sequel-pro-${sequel_version}.dmg",
  }

  # vm
  include virtualbox
  include vagrant
  vagrant::plugin { 'vagrant-aws': }
  vagrant::plugin { 'vagrant-digitalocean': }
  vagrant::plugin { 'vagrant-omnibus': }
  vagrant::plugin { 'vagrant-vbox-snapshot': }

  # Editor
  include sublime_text
  sublime_text::package { 'Emmet': source => 'sergeche/emmet-sublime' }
  sublime_text::package { 'ConvertToUTF-8': source => 'seanliang/ConvertToUTF8' }
  sublime_text::package { 'SublimeLinter-ruby': source => 'SublimeLinter/SublimeLinter-ruby' }
  sublime_text::package { 'SublimeLinter-haml': source => 'SublimeLinter/SublimeLinter-haml' }
  sublime_text::package { 'SublimeLinter-json': source => 'SublimeLinter/SublimeLinter-json' }
  sublime_text::package { 'SublimeLinter-jshint': source => 'SublimeLinter/SublimeLinter-jshint' }
  sublime_text::package { 'SublimeLinter-coffeelint': source => 'SublimeLinter/SublimeLinter-coffeelint' }
  # package { 'HexFiend':
  #   source   => "http://ridiculousfish.com/hexfiend/files/HexFiend.zip",
  #   provider => "compressed_app",
  # }
  package { 'MacOView':
    source   => 'http://downloads.sourceforge.net/project/machoview/MachOView-2.4.9200.dmg',
    provider => 'appdmg'
  }
  package { 'Dash':
    source   => 'http://kapeli.com/Dash.zip',
    provider => 'compressed_app'
  }
  package { 'evernote':
    provider => 'appdmg_eula',
    source   => 'http://cdn1.evernote.com/mac/release/Evernote_402634.dmg'
  }

  # Uploader
  package { 'Cyberduck':
    provider   => 'compressed_app',
    source     => 'https://update.cyberduck.io/Cyberduck-4.5.2.zip'
  }
  # package { 'filezilla':
  #   provider => 'compressed_app',
  #   source => 'http://downloads.sourceforge.net/project/filezilla/FileZilla_Client/3.7.3/FileZilla_3.7.3_i686-apple-darwin9.app.tar.bz2',
  # }

  # Storage
  package { 'Dropbox':
    provider => 'appdmg',
    source   => "https://d1ilhw0800yew8.cloudfront.net/client/Dropbox%202.10.28.dmg",
  }

  # iOS dev utility
  package { 'testflight':
      provider => "compressed_app",
      source   => "https://d193ln56du8muy.cloudfront.net/desktop_app/1381509820/TestFlight-Desktop-1.0-Beta(313).zip",
  }
  package { 'SimPholders2':
    source   => 'http://simpholders.com/site/assets/files/1098/sp20a-87.zip',
    provider => 'compressed_app',
  }

  # Browser
  package { 'Chrome':
      provider => 'appdmg',
      source   => 'https://dl.google.com/chrome/mac/stable/GoogleChrome.dmg',
  }
  package { 'Firefox':
    source   => 'https://download.mozilla.org/?product=firefox-33.0.2-SSL&os=osx&lang=en-US',
    provider => 'appdmg'
  }

  # virus
  package { 'ClamXav':
    source   => "http://www.clamxav.com/downloads/ClamXav_2.6.4.dmg",
    provider => appdmg;
  }

  # Utility
  package { 'Language Switcher':
    provider => "appdmg",
    source   => "http://www.tj-hd.co.uk/downloads/Language_Switcher_1_1_7.dmg",
  }
  package { 'macam':
    provider => "appdmg",
    source   => "http://downloads.sourceforge.net/project/webcam-osx/macam/0.9.2/macam.0.9.2.dmg",
  }
  package { 'DiskWave':
    source   => 'http://diskwave.barthe.ph/download/DiskWave_0.4.dmg',
    provider => 'appdmg'
  }
  package { 'Knock':
    source   => 'http://knock-updates.s3.amazonaws.com/Knock.zip',
    provider => 'compressed_app'
  }
  package { 'google_japanese_input':
    source   => 'http://dl.google.com/dl/japanese-ime/1.8.1310.1/googlejapaneseinput.dmg',
    provider => 'pkgdmg'
  }
  package { 'Alfred 2':
    provider => 'compressed_app',
    source   => "http://cachefly.alfredapp.com/Alfred_2.4_279.zip"
  }
  package { 'Flux':
    source => 'https://justgetflux.com/mac/fluxbeta.zip',
    provider => 'compressed_app'
  }
  package { 'Cinch':
    source   => 'http://www.irradiatedsoftware.com/download/Cinch.zip',
    provider => 'compressed_app'
  }
  package { 'VLC':
    provider => 'appdmg',
    source   => 'http://get.videolan.org/vlc/2.1.5/macosx/vlc-2.1.5.dmg',
  }
  package { 'Gifzo':
    provider => 'compressed_app',
    source   => 'http://gifzo.net/Gifzo.zip',
  }

  # Communication
  package { 'Sqwiggle':
    source   => 'https://s3.amazonaws.com/sqwiggle-releases/mac/sqwiggle-0.6.3.dmg',
    provider => 'appdmg'
  }
  package { 'Skype':
    provider => 'appdmg',
    source   => 'http://download.skype.com/macosx/Skype_6.19.0.442.dmg',
  }
  package { 'HipChat':
    provider => 'compressed_app',
    source   => 'https://www.hipchat.com/downloads/latest/mac',
    flavor   => 'zip',
  }

  # #
  # # dotfile setting
  # #
  # $home     = "/Users/${::boxen_user}"
  # $dotfiles = "${home}/dotfiles"

  # repository { $dotfiles:
  #   source  => 'ae06710/dotfiles'
  # }

  # exec { "dotfile-setup":
  #   cwd => $dotfiles,
  #   command => 'sh ${dotfiles}/install.sh',
  #   creates => "${home}/.zshrc",
  #   require => Repository[$dotfiles],
  #   notify  => Exec['dotfile-submodule-update'],
  # }

  # exec { "dotfile-submodule-update":
  #   cwd => $dotfiles,
  #   command => 'git submodule init && git submodule update',
  #   creates => "${dotfiles}/antigen/.env",
  # }
}
