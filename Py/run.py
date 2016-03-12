#!/usr/bin/env python

import envoy
import os
import shutil

_path_ = {
  'home': os.environ['HOME'],
  'script': os.path.split(os.path.realpath(__file__))[0]
}

isPrintCommander = True
# isPrintCommander = False

_source_ = {
  'nvm': 'https://raw.githubusercontent.com/creationix/nvm/v0.24.0/install.sh',
  'nvm-fish-wrapper': 'git://github.com/passcod/nvm-fish-wrapper.git'
}

node_version = '0.12.7'

pkgs = [
  'pm2',
  'http-server',
  'coffee-script',
  'cson',
  'harp',
  'gitbook-cli',
  'hexo-cli',
  'gulp-cli',
  'node-inspector'
  'react-native-cli'
]

def print_log (r):
  print r.status_code
  print r.std_out
  print r.std_err

def add_line (line_str, file_path):
  lines = []
  indexs = []

  with open(file_path, 'r+') as f:
    lines = f.readlines()

    for index, line in enumerate(lines):
      if line_str in line:
        indexs.append(index)

    if len(indexs) is 0:
      f.write(line_str)

    f.closed

def run_commander (commander):
  if isPrintCommander == True:
    print commander
  r = envoy.run(commander)
  print_log(r)

def nvm_install():
  commander = "curl {nvm_install_file} | bash"
  commander = commander.format(
    nvm_install_file = _source_['nvm']
  )
  run_commander(commander)

 def nvm_config():
  line_str = ". {path_home}/.nvm/nvm.sh"
  line_str = line_str.format(
    path_home = _path_['home']
  )

  zsh_rc = "{path_home}/.zshrc".format(
    path_home = _path_['home']
  )

  add_line(line_str, zsh_rc)

def nvm_fish_wrapper_get():
  nvm_wrapper_path = "{home}/.config/fish/nvm-wrapper"
  nvm_wrapper_path = nvm_wrapper_path.format(home = _path_['home'])

  # clean nvm_wrapper
  if os.path.exists(nvm_wrapper_path):
    shutil.rmtree(nvm_wrapper_path)

  commander = "git clone {source_nvm_fish_wrapper} {nvm_wrapper_path}"
  commander = commander.format(
    source_nvm_fish_wrapper = _source_['nvm-fish-wrapper'],
    nvm_wrapper_path = nvm_wrapper_path
  )

  run_commander(commander)

 def nvm_support_fish():
  line_str = ". {path_home}/.config/fish/nvm-wrapper/nvm.fish"
  line_str = line_str.format(
    path_home = _path_['home']
  )

  fish_config = "{path_home}/.config/fish/config.fish"
  fish_config = fish_config.format(
    path_home = _path_['home']
  )

  add_line(line_str, fish_config)

def node_install():
  commanders = [
    'nvm install {node_version}'.format(node_version = node_version),
    'nvm alias 12 {node_version}'.format(node_version = node_version),
    'nvm alias default 12',
    'nvm use default'
  ]
  for commander in commanders:
    run_commander(
      "fish -c '{commander}'".format(commander = commander)
    )

def cnpm_install():
  commander = 'npm install -g cnpm --registry=https://r.cnpmjs.org'
  commander = "bash -lc '{commander}'".format(commander = commander)
  run_commander(commander)

def pkgs_install_all():
  pkg_names = ' '.join(pkgs)
  commander = 'npm install -g {pkg_names}'.format(pkg_names = pkg_names)
  commander = "bash -lc '{commander}'".format(commander = commander)
  run_commander(commander)

def pkgs_install():
  for pkg in pkgs:
    commander = 'npm install -g {pkg}'.format(pkg = pkg)
    commander = "bash -lc '{commander}'".format(commander = commander)
    run_commander(commander)

nvm_install()
nvm_config()
nvm_fish_wrapper_get()
nvm_support_fish()
node_install()
pkgs_install()
