# https://stackoverflow.com/a/51088667/1705829
# usr=/usr
site_packages=/home/tk/.local/lib/python3.8/site-packages
# ls $site_packages/__pycache__
for d in $(find /usr -type d -name dist-packages); do
  pushd $d
  cd ..
  if test -d dist-packages/__pycache__; then
    echo 1
    mv -v dist-packages/__pycache__/* $site_packages/__pycache__/
    # rmdir -v dist-packages/__pycache__
  fi
#   pwd
    # if test -d dist-packages ; then 
      mv -v dist-packages/* $site_packages
    # fi
  rmdir -v dist-packages
  ln -sv $site_packages dist-packages
  popd
done