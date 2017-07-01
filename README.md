# What
It is a script generating a rails app & creating docker containers to use it

# How

```bash
chmod +x ./script.sh
./script.sh -n [app-name] -p [full-path]
```

Ex:
```bash
./script.sh -n rails-api -p /var/app
```

The script will generate your rails app in `/var/app/rails-api` directory
