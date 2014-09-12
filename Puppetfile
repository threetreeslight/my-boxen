# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

# Shortcut for a module from GitHub's boxen organization
def github(name, *args)
  options ||= if args.last.is_a? Hash
    args.last
  else
    {}
  end

  if path = options.delete(:path)
    mod name, :path => path
  else
    version = args.first
    options[:repo] ||= "boxen/puppet-#{name}"
    mod name, version, :github_tarball => options[:repo]
  end
end

# Shortcut for a module under development
def dev(name, *args)
  mod name, :path => "#{ENV['HOME']}/src/boxen/puppet-#{name}"
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "3.6.2"

# Support for default hiera data in modules

github "module_data", "0.0.3", :repo => "ripienaar/puppet-module-data"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "dnsmasq",     "1.0.1"
github "foreman",     "1.2.0"
github "gcc",         "2.1.1"
github "git",         "2.5.0"
github "go",          "1.1.0"
github "homebrew",    "1.9.4"
github "hub",         "1.3.0"
github "inifile",     "1.0.3", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx",       "1.4.3"
github "nodejs",      "3.8.1"
github "openssl",     "1.0.0"
github "phantomjs",   "2.3.0"
github "pkgconfig",   "1.0.0"
github "repository",  "2.3.0"
github "ruby",        "8.1.2"
github "stdlib",      "4.2.1", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",        "1.0.0"
github "xquartz",     "1.2.0"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.

# general
github "osx",               "2.7.0"
github "property_list_key", "0.2.1", :repo => "glarizza/puppet-property_list_key"

# lib
github "wget",           "1.0.1"
github "java",           "1.7.0"
github "python",         "2.0.1", :repo => "mloberg/puppet-python" # Mange Python with Boxen and pyenv
github "libtool",        "1.0.0" # use for php
github "pcre",           "1.0.0" # use for php
github "libpng",         "1.0.0" # use for php
github "php",            "1.2.4"
github "imagemagick",    "1.3.0"
github "vagrant",        "3.1.1"
github "qt",             "1.3.1" # use for capybara-webkit
github "zsh",            "1.0.0"
github "heroku",         "2.0.0"
github "postgresql",     "3.0.0"
github "sysctl",         "1.0.1" # use for postgresql
github "redis",          "3.0.2"


# local application for develop
github "sequel_pro",     "1.0.1"
github "iterm2",         "1.0.4"
github "virtualbox",     "1.0.10"
github "sublime_text_2", "1.1.2"
github "chrome",         "1.1.2"
github "firefox",        "1.1.8"
# github "tunnelblick",    "1.0.4"
github "cyberduck",      "1.0.1"

# local application for utility
github "google_japanese_input", "1.0.0", :repo => "ngs/puppet-google_japanese_input"
github "dropbox",               "1.2.0"
github "skype",                 "1.0.8"
github "hipchat",               "1.1.0"
github "alfred",                "1.1.7"
github "mou",                   "1.1.3"
github "evernote",              "2.0.4"
github "vlc",                   "1.0.5"
github "flux",                  "1.0.0"
github "cinch",                 "1.0.1"
# github "steam",                 "1.0.1"

