set -e

endColor="\033[0m"
echo_with_color(){  
  blue="\033[0;34m"
  echo "$blue $1 $endColor"
}
echo_error(){
  red="\033[0;31m"
  echo "$red $1 $endColor"
}

path=''
appName=''
error=false
while getopts ':n:p:' flag; do
  case $flag in 
    n) 
      appName=$OPTARG
      ;;
    p) 
      path=$OPTARG
      ;;
    *) 
      echo_error "Arg '$OPTARG' not exist" 
      error=true
      ;;
  esac
done

#
if $error; then
  exit
fi

# if path not exist
if [ ! -d $path ]; then
  echo_error "Dir '$path' not exist"
  exit
fi

# if appName is nil
if [ $appName == '' ]; then
  echo_error 'appName is nil'
  exit
fi


echo_with_color "=== Create rails app in '$path' with name: $appName"

fullPath=$path/$appName
set -x
mkdir $fullPath
docker run --name $appName -v $fullPath:/var/app/$appName -w /var/app -ti ruby:2.4 /bin/bash -c "gem install rails; rails new $appName --api"
docker rm -f $(docker ps -aq --filter "name=$appName")
set +x


echo_with_color "=== Set docker config for development env"

set -x
cp -r ./docker-config $fullPath
cp ./docker-compose.yml $fullPath
set +x


echo_with_color "=== Set database.yml config and update Gemfile"

set -x
cp ./rails-config/database.yml $fullPath/config/
cd $fullPath 
sed -i -e 's/sqlite3/pg/' Gemfile
docker-compose -p $appName -f docker-compose.yml up --build -d
set +x
