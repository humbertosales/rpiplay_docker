# rpiplay_docker FORK compiled to RPI 1, ZERO e ZERO W (arm32v6)

This repo tries to provide a docker image for the awesome [RPiPlay](https://github.com/FD-/RPiPlay) software.
Please note, that this image works only on raspbian/raspberry-pi-os (at least currently).

https://hub.docker.com/r/humbertosales/rpiplay

## Credits
To build the image, I used [RPiPlay-docker-builder](https://github.com/nicolaspernoud/RPiPlay-docker-builder) - Thank you so much @nicolaspernoud 

## Before you start
Before running the image, you should (unless already done) bump the video memory of your raspberry pi to 256 MB.
To do that, you can use `raspi-config > Advanced Options > Memory Split`.
Please also read [this issue](https://github.com/FD-/RPiPlay/issues/8).

## Usage
Run the image:
```
docker run --rm -ti -v /opt/vc:/opt/vc --net=host --privileged humbertosales/rpiplay
```

Run with debug:
```
docker run --rm -ti -v /opt/vc:/opt/vc --net=host --privileged humbertosales/rpiplay -d
```

- Mounting the `/opt/vc` folder gives that container access to native apis of the raspberry pi (this requires privileged mode).
- Host network is obviously required. 

### Environment variables
You may provide the following environment variables

| Variable | Description | Default |
| -------- | ----------- | ------- |       
|RPI_PLAY_AUDIO |RPiPlay audio mode |hdmi |
|RPI_PLAY_NAME |Network name |RPiPlay |

``Extra args (e.g. -l or -d)`` pass parameter docker run (CMD).

Please also see the [RPiPlay Usage documentation](https://github.com/FD-/RPiPlay#usage).

## Tested platforms

| Hardware | OS |
| -------- | -- |
|Raspberry Pi Zero (not W) |[Hypriot OS on HOST](https://blog.hypriot.com/) 1.12.3 |


Please keep in mind that this image is not guaranteed to run on any platform that theoretically should be supported.

## Please note
This project is not under active maintenance and probably not the ultimate solution for the problem - It originated out of personal need and interest.

I published it, to eventually help somebody.

Also, a **huge thank you** to the awesome people who made this awesome software - I basically only copied it.
