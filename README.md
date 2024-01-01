# nowayvnc

> ⚠ proof-of-concept now

`{no,way}vnc`: `novnc` & `wayvnc`

Docker container that run wayland compositor and expose novnc interface.

## usage

> Warning: Seems like Ctrl+C (SIGINT) not working.
> Use:
> ```bash
> docker kill "container_name"
> ```

```bash
docker run --device /dev/dri:/dev/dri --publish 6080:6080
```

open `localhost:6080`
