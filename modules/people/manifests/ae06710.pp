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
      'coreutils',                  # change mac command to like GNU Linux
      'pstree',                     # like linux ps -f option cmd
      'tree',                       # linux tree cmd
      'z',                          # shortcut change dir
      'zsh-completions',            # shortcut change dir
      'vim',                        # mac preinstalled vim is old X(
      'the_silver_searcher',        # alternative grep
      'proctools',                  # kill by process name. like $ pkill firefox
      'jq',                         # json perser pipeline
      'ctags',                      # vim compel
      'putty',                      # use convert ppk key to OpenSSH format
      'tmux',                       # terminal session
      'reattach-to-user-namespace', # use tmux to clipbord
      'tig',                        # git cui client
      'graphviz',                   # graph generator (use for rails-erd)
      'ffmpeg',
      'mysql',
      'packer'                      # vagrant box maker
    ]:
  }

  include java
  python::version { '2.7.6': }
  $python_version = '2.7.6'
  python::package { "virtualenv for ${python_version}":
    package => 'virtualenv',
    python  => $python_version,
  }
  python::package { "virtualenvwrapper ${python_version}":
    package => 'virtualenvwrapper',
    python  => $python_version,
  }
  python::package { "percol for ${python_version}":
    package => 'percol',
    python  => $python_version,
  }
  python::package { "stellar for ${python_version}":
    package => 'stellar',
    python  => $python_version,
  }
  python::package { "awscli for ${python_version}":
    package => 'awscli',
    python  => $python_version,
  }
  class { 'python::global': version => '2.7.6' }
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
  include wget
  include zsh
  include imagemagick
  phantomjs::version { '1.9.2': }
  include heroku

  # ruby
  # ruby_gem { 'git-issue for all ruby versions':
  #   gem          => 'git-issue',
  #   ruby_version => '*'
  # }
  # ruby_gem { 'chef for all ruby versions':
  #   gem          => 'chef',
  #   ruby_version => '*'
  # }
  # ruby_gem { 'knife-solo for all ruby versions':
  #   gem          => 'knife-solo',
  #   ruby_version => '*'
  # }
  ruby_gem { 'rubocop for all ruby versions':
    gem          => 'rubocop',
    ruby_version => '*'
  }


  #
  # local application for develop
  #
  include sequel_pro
  include virtualbox
  include vagrant
  vagrant::plugin { 'vagrant-aws': }
  vagrant::plugin { 'vagrant-digitalocean': }
  vagrant::plugin { 'vagrant-omnibus': }
  vagrant::plugin { 'vagrant-vbox-snapshot': }
  include iterm2::stable
  include sublime_text_2
  sublime_text_2::package { 'Emmet': source => 'sergeche/emmet-sublime' }
  sublime_text_2::package { 'GitGutter': source => 'jisaacks/GitGutter' }
  sublime_text_2::package { 'TrailingSpaces': source => 'SublimeText/TrailingSpaces' }
  sublime_text_2::package { 'ConvertToUTF-8': source => 'seanliang/ConvertToUTF8' }
  sublime_text_2::package { 'SublimeLinter-ruby': source => 'SublimeLinter/SublimeLinter-ruby' }
  sublime_text_2::package { 'SublimeLinter-haml': source => 'SublimeLinter/SublimeLinter-haml' }
  sublime_text_2::package { 'SublimeLinter-json': source => 'SublimeLinter/SublimeLinter-json' }
  sublime_text_2::package { 'SublimeLinter-jshint': source => 'SublimeLinter/SublimeLinter-jshint' }
  sublime_text_2::package { 'SublimeLinter-coffeelint': source => 'SublimeLinter/SublimeLinter-coffeelint' }
  # include tunnelblick
  include cyberduck
  # package { 'filezilla':
  #   provider => 'compressed_app',
  #   source => 'http://downloads.sourceforge.net/project/filezilla/FileZilla_Client/3.7.3/FileZilla_3.7.3_i686-apple-darwin9.app.tar.bz2',
  # }
  include firefox
  include chrome
  package { 'testflight':
      provider => "compressed_app",
      source   => "https://d193ln56du8muy.cloudfront.net/desktop_app/1381509820/TestFlight-Desktop-1.0-Beta(313).zip",
  }



  #
  # local application for utility
  #
  package { 'ClamXav':
    source   => "http://www.clamxav.com/downloads/ClamXav_2.6.1.dmg",
    provider => appdmg;
  }
  package { 'Language Switcher':
    provider => "appdmg",
    source   => "http://www.tj-hd.co.uk/downloads/Language_Switcher_1_1_7.dmg",
  }
  package { 'macam':
    provider => "appdmg",
    source   => "http://downloads.sourceforge.net/project/webcam-osx/macam/0.9.2/macam.0.9.2.dmg",
    # if you want video cam driver install manually
  }
  package { 'HexFiend': # binary editor
    provider => "compressed_app",
    source   => "http://ridiculousfish.com/hexfiend/files/HexFiend.zip",
  }
  package { 'MacOView':
    source   => 'http://downloads.sourceforge.net/project/machoview/MachOView-2.4.9000.dmg',
    provider => 'appdmg'
  }
  # package { 'Gitter':
  #   source   => 'http://update.gitter.im/osx/Gitter-1.146.dmg',
  #   provider => 'appdmg'
  # }
  package { 'Dash':
    source   => 'http://kapeli.com/Dash.zip',
    provider => 'compressed_app'
  }
  # package { 'Sqwiggle':
  #   source   => 'https://s3.amazonaws.com/sqwiggle-releases/mac/sqwiggle-0.4.8.dmg',
  #   provider => 'appdmg'
  # }

  include google_japanese_input
  include dropbox
  include skype
  include hipchat
  include alfred
  # include mou
  # include mou::themes
  # mou::preferences { 'Mou':
  #   theme => 'Solarized (Dark)+',
  #   css => 'GitHub2'
  # }
  include evernote
  include vlc
  include flux
  include cinch

  # rbenv plugins
  repository { '/opt/boxen/rbenv/plugins/gem-src':
    source  => 'amatsuda/gem-src'
  }

  #
  # dotfile setting
  #
  $home     = "/Users/${::boxen_user}"
  $dotfiles = "${home}/dotfiles"

  repository { $dotfiles:
    source  => 'ae06710/dotfiles'
  }

  exec { "dotfile-setup":
    cwd => $dotfiles,
    command => 'sh ${dotfiles}/install.sh',
    creates => "${home}/.zshrc",
    require => Repository[$dotfiles],
    notify  => Exec['dotfile-submodule-update'],
  }

  exec { "dotfile-submodule-update":
    cwd => $dotfiles,
    command => 'git submodule init && git submodule update',
    creates => "${dotfiles}/antigen/.env",
  }
}
