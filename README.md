Soldier of Fortune II - Docker Container
===

Creates a docker container for Soldier of Fortune II. Base game files are copied into the container so the only thing on the host is the mods/configs.

Build
---

1. `git clone https://github.com/ryanclouser/docker-sof2.git`
1. Copy the `base` folder from the CDs to the cloned repository.
1. `docker build -t sof2 .`

Configuration
---

1. Create a folder with the mod name and place the relevant PK3 files inside. (eg. `osp` or `rocmod`)
1. Create a `server.cfg` config file in this folder. This is where the server related settings will go.

Service
---

This is an example. Change the paths and mod name as needed.

```
[Unit]
Description=sof2 server
After=docker.service
Requires=docker.service

[Service]
Type=simple
Restart=always
RestartSec=60
ExecStart=/usr/bin/docker run --name sof2 --rm -p 20100:20100/udp -e "SOF2_GAME=osp" -v /mnt/sof2/osp:/home/docker/osp:rw sof2
ExecStop=/usr/bin/docker stop sof2

[Install]
WantedBy=multi-user.target
```

Service Run
---

```
systemctl daemon-reload
systemctl start sof2.service
systemctl enable sof2.service
```

Command Run
---

```
docker run -it --name sof2 --rm -p 20100:20100/udp -e "SOF2_GAME=MOD" -v /path/to/MOD:/home/docker/MOD:rw sof2
```

Environment Variables
---

- `SOF2_CONFIG`
   - Config the server should load. Default is `server.cfg`.
- `SOF2_GAME`
   - Sets the `fs_game` variable. This can be `osp`, `rocmod`, etc. depending on what mods you plan to use. By default this is not set to anything.
