# Pterodactyl Nginx + Node Egg

A Pterodactyl Egg specifically designed to run Nginx with Node.js support. Autoupdate is removed for now. This is a WIP,
some functionality may be missing, and is not expected to be run in production environments. 

Originally forked from [Ym0T/pterodactyl-nginx-egg](https://github.com/Ym0T/pterodactyl-nginx-egg)

## Nginx Reverse Proxy to Node.js
Example Nginx configuration to reverse proxy to a Node.js application running on the same server.

```nginx
location / {
    proxy_pass http://localhost:8125; # Replace with your Node.js app's address and port
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;
}
```

Add this configuration in `/home/container/nginx/conf.d/default.conf`, inside the `server` block.

## Docker Image
https://hub.docker.com/r/ririkoai/pterodactyl-nginx-node/tags

## Note
* If you need to install the node modules first, you can set the "NPM Start Command" startup variable in Pterodactyl to
  `npm install` or `yarn install` depending on your package manager. Afterwards, you can set it back to `npm start` etc.
* Allocate additional ports for each service you want to run (e.g., if you want to run both Nginx and a Node.js backend,
  allocate two ports).

## License

[MIT License](https://choosealicense.com/licenses/mit/)

Forked and adapted from: https://github.com/Ym0T/pterodactyl-nginx-egg and https://gitlab.com/tenten8401/pterodactyl-nginx