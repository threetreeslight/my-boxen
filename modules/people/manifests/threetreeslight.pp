class people::threetreeslight {
  #
  # osx
  #
  # general
  include osx::global::tap_to_click
  # Finder
  include osx::finder::unhide_library
  include osx::finder::show_hidden_files
  include osx::finder::show_all_filename_extensions
  include osx::finder::show_warning_before_emptying_trash
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
  # package
  #
  homebrew::tap { 'codekitchen/dinghy': }
  package {
    [
      'readline', # use for ruby compile
      'coreutils', # change mac command to like GNU Linux
      'ctags', # vim compel
      'elixir',
      'embulk',
      'direnv',
      'ffmpeg',
      'git-secrets', # detect secret file on git hook
      'graphviz', # graph generator (use for rails-erd)
      'heroku',
      'hub', # github cli
      'imagemagick', # convert, Edit, And Compose Images
      'jid', # json interactive filter
      'jq', # json perser pipeline
      'libidn', # encode/decode utf-8 domain
      'libxml2', # need for nokogiri
      'memcached',
      'mobile-shell',
      'mycli',
      'mysql',
      'neovim',
      'openssl',
      'packer',
      'peco', # interactive filter
      'percona-toolkit',
      'pgcli',
      'pstree', # ps axf like command on FreeBSD
      'putty', # use convert ppk key to OpenSSH format
      'reattach-to-user-namespace', # use tmux to clipbord
      'source-highlight', # performance test
      'siege', # performance test
      'terraform',
      'tig', # git cui client
      'tmux', # terminal session
      'tmux-cssh', # terminal session
      'tree', # linux tree cmd
      'vim', # mac preinstalled vim is old X(
      'watch',
      'wget',
      'z', # memois cd
      'zsh',
      'dinghy', # for docker
      'zsh-completions'
    ]:
  }
  package { 'alfred': provider => 'brewcask' }
  package { 'amethyst': provider => 'brewcask' }
  package { 'atom': provider => 'brewcask' }
  package { 'caffeine': provider => 'brewcask' }
  package { 'dash': provider => 'brewcask' }
  package { 'dropbox': provider => 'brewcask' }
  package { 'firefox': provider => 'brewcask' }
  package { 'gitify': provider => 'brewcask' }
  package { 'google-chrome': provider => 'brewcask' }
  package { 'google-japanese-ime': provider => 'brewcask' }
  package { 'gyazo': provider => 'brewcask' }
  package { 'flux': provider => 'brewcask' }
  package { 'ios-console': provider => 'brewcask' }
  package { 'iterm2': provider => 'brewcask' }
  package { 'karabiner': provider => 'brewcask' }
  package { 'lastpass': provider => 'brewcask' }
  package { 'mysqlworkbench': provider => 'brewcask' }
  package { 'postman': provider => 'brewcask' }
  package { 'sequel-pro': provider => 'brewcask' }
  package { 'simpholders': provider => 'brewcask' }
  package { 'slack': provider => 'brewcask' }
  package { 'skype': provider => 'brewcask' }
  package { 'virtualbox': provider => 'brewcask' }
  package { 'vlc': provider => 'brewcask' }
  package { 'wmail': provider => 'brewcask' }

  #
  # ruby
  #
  ruby_gem { 'rubocop for all ruby versions':
    gem          => 'rubocop',
    ruby_version => '*'
  }
  ruby_gem { 'tmuxinator for all ruby versions':
    gem          => 'tmuxinator',
    ruby_version => '*'
  }
  ruby_gem { 'cocoapods for all ruby versions':
    gem          => 'cocoapods',
    ruby_version => '*'
  }
  # # rbenv plugins
  # repository { '/opt/boxen/rbenv/plugins/gem-src':
  #   source  => 'amatsuda/gem-src'
  # }

  #
  # phantomjs
  #
  phantomjs::version { '2.1.1': }

  #
  # vagrant
  #
  include vagrant
  vagrant::plugin { 'vbox-snapshot': }

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
