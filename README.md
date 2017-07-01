# What
It is a script generating a rails app & creating docker containers to use it

# How

```bash
chmod +x ./script.sh
./script.sh -n [app-name] -p [full-path] -o [rails-new-opts]
```

`-o` option is optional. It permits to define options for the `rails new` command

Ex:
```bash
./script.sh -n rails-api -p /var/app -o '--api'
```

The script will generate your rails app in `/var/app/rails-api` directory
