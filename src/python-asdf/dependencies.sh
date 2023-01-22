set -e

ensure_packages() {
  if ! dpkg -s "$@" >/dev/null 2>&1; then
    if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
      echo "Running apt-get update..."
      apt-get update -y
    fi
    apt-get -y install --no-install-recommends "$@"
  fi
}


ensure_featmake () {
    if ! type featmake > /dev/null 2>&1; then
        temp_dir=/tmp/featmake-download
        mkdir -p $temp_dir

        curl -sSL -o $temp_dir/featmake https://github.com/devcontainers-contrib/cli/releases/download/v0.0.18/featmake
        curl -sSL -o $temp_dir/checksums.txt https://github.com/devcontainers-contrib/cli/releases/download/v0.0.18/checksums.txt

        (cd $temp_dir ; sha256sum --check --strict $temp_dir/checksums.txt)

        chmod a+x $temp_dir/featmake
        mv -f $temp_dir/featmake /usr/local/bin/featmake

        rm -rf $temp_dir
    fi
}

# Python build dependencies
ensure_packages curl make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev llvm libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

ensure_featmake

# refresh PATH
PS1='\s-\v\$' source /etc/profile

# installing ghcr.io/devcontainers-contrib/features/asdf-package:1.0.1
featmake "ghcr.io/devcontainers-contrib/features/asdf-package:1.0.1" -PLUGIN "python" -VERSION "$VERSION"

