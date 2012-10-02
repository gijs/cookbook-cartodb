
# CartoDB only supports node 0.4.x at this time. See: https://github.com/Vizzuality/cartodb#install-nodejs
default.nodejs['version'] = "v0.4.12"
default.nodejs['download_url'] = "https://github.com/joyent/node/tarball/#{node.nodejs['version']}"

default.cartodb['dir'] = "/usr/local"
default.cartodb['user'] = "cartodb"
default.cartodb['repo'] = "git://github.com/Vizzuality/cartodb.git"
default.cartodb['revision'] = "rs0915"
