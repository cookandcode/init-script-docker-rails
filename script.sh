docker run --name test-rails -v /PATH:/var/app/$appName -w /var/app -ti ruby:2.4 /bin/bash -c "gem install rails; rails new $appName --api"
# TO CONTINUE
