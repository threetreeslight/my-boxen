class people::chiral{

  #
  # osx
  #

  # Finder
  include osx::finder::unhide_library
  include osx::finder::show_hidden_files

  # Dock
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

  #
  # lib
  #

  homebrew::tap { 'homebrew/binary': }
  package {
    [
      'readline',                   # use for ruby compile
      'coreutils',                  # change mac command to like GNU Linux
      'tree',                       # linux tree cmd
      'z',                          # shortcut change dir
      'the_silver_searcher',        # alternative grep
      'proctools',                  # kill by process name. like $ pkill firefox
      'graphviz',                   # graph generator (use for rails-erd)
      'tmux',                       # terminal session
      'tig',                        # git cui client
      'reattach-to-user-namespace', # use tmux to clipbord
      'ec2-api-tools',              # aws cli tools
      'ec2-ami-tools',              # aws cli tools
      'putty'                       # use convert ppk key to OpenSSH format
      # 'ghc',
      # 'haskell-platform'
    ]:
  }

  include java
  include php::5_4_17
  include php::composer
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
  php::extension::xdebug { 'xdebug for 5.4.17':
    php => '5.4.17'
  }
  include postgresql
  include mysql
  include redis
  include wget
  include imagemagick
  include phantomjs
  phantomjs::version { '1.9.2': }

  # ruby
  ruby::gem { "chef for 2.0.0-p247":
    gem     => 'chef',
    ruby    => '2.0.0-p247'
  }
  ruby::gem { "knife-solo for 2.0.0-p247":
    gem     => 'knife-solo',
    ruby    => '2.0.0-p247'
  }

  #
  # local application for develop
  #
  include sequel_pro
  include virtualbox
  include vagrant
  vagrant::plugin { 'vagrant-aws': }
  vagrant::plugin { 'vagrant-berkshelf': }
  vagrant::plugin { 'vagrant-omnibus': }
  include iterm2::stable
  include sublime_text_2
  sublime_text_2::package { 'Emmet':
    source => 'sergeche/emmet-sublime'
  }
  sublime_text_2::package { 'ConvertToUTF-8':
    source => 'seanliang/ConvertToUTF8'
  }
  include cyberduck
  package { 'filezilla':
    provider => 'compressed_app',
    source => 'http://downloads.sourceforge.net/project/filezilla/FileZilla_Client/3.7.3/FileZilla_3.7.3_i686-apple-darwin9.app.tar.bz2',
  }
  include firefox
  include chrome


  #
  # local application for utility
  #
  package { 'ClamXav':
      source   => "http://www.clamxav.com/downloads/ClamXav_2.6.1.dmg",
      provider => appdmg;
  }
  include skype
  include hipchat
  include alfred
  include mou
  include mou::themes
  include vlc
  include flux
  include cinch

}
