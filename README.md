# ROS explore_lite node in Docker [![](https://img.shields.io/docker/pulls/frankjoshua/ros3-m-explore)](https://hub.docker.com/r/frankjoshua/ros3-m-explore) [![CI](https://github.com/frankjoshua/docker-ros3-m-explore/workflows/CI/badge.svg)](https://github.com/frankjoshua/docker-ros3-m-explore/actions)

## Description

Runs a ros2 explore_lite node in a Docker container. Probably need --network="host" because ROS uses ephemeral ports.


## Example

```
docker run -it \
    --network="host" \
    frankjoshua/ros3-m-explore
```

## Building

Use [build.sh](build.sh) to build the docker containers.

<br>Local builds are as follows:

```
./build.sh -t frankjoshua/ros3-m-explore -l
```

## Testing

Github Actions expects the DOCKERHUB_USERNAME and DOCKERHUB_TOKEN variables to be set in your environment.

## License

Apache 2.0

## Author Information

Joshua Frank [@frankjoshua77](https://www.twitter.com/@frankjoshua77)
<br>
[http://roboticsascode.com](http://roboticsascode.com)
