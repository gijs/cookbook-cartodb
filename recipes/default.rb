
include_recipe 'ark'
include_recipe 'python::pip'

case node[:platform]
when 'ubuntu'
  include_recipe 'mapnik::ubuntu'
  include_recipe 'gis::ubuntugis'

  dependencies = %w|postgresql-plpython-9.1 libjson0-dev|

  dependencies.each do |pkg|
    package pkg do
      action :install
    end
  end
else
  Chef::Log.warn("Sorry. for ubuntu only.")
end


# Installing node.js ##########################################################
# I need to do this because there is no any good nodejs cookbooks and cartodb
# currently only supports nodejs 0.4.x.

ark "nodejs" do
  url       node.nodejs['download_url']
  extension "tar.gz"
  action    [ :configure, :install_with_make ]
end

# Installing npm ##############################################################

bash 'install_npm' do
  not_if "which npm"
  user 'root'
  cwd  '/tmp/'
  code <<-EOH
  wget -O - https://npmjs.org/install.sh | clean=no sh
  EOH
end

