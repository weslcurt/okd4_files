echo "Setting cluster domain name to: $1.$2"

# Replace dns references in named config
sed -i 's/okd.home.lab/'$1.$2'/g' db.192.168.1
sed -i 's/home.lab/'$2'/g' db.192.168.1
sed -i 's/okd.home.lab/'$1.$2'/g' db.home.lab
sed -i 's/home.lab/'$2'/g' db.home.lab
mv db.home.lab db.$2
sed -i 's/home.lab/'$2'/g' named.conf.local

# Replace dns references in install_config.yaml
sed -i 's/home.lab/'$2'/g' install-config.yaml
sed -i 's/name: okd/name: '$1'/g' install-config.yaml