# rpiplay_docker
This repo tries to provide a docker image for the awesome [RPiPlay](https://github.com/FD-/RPiPlay) software.
Please note, that this image works only on raspbian/raspberry-pi-os (at least currently).

## Credits
To build the image, I used [RPiPlay-docker-builder](https://github.com/nicolaspernoud/RPiPlay-docker-builder) - Thank you so much @nicolaspernoud 

## Before you start
Before running the image, you should (unless already done) bump the video memory of your raspberry pi to 256 MB.
To do that, you can use `raspi-config > Advanced Options > Memory Split`.
Please also read [this issue](https://github.com/FD-/RPiPlay/issues/8).

## Usage
Run the image:
```
docker run \
  -v /opt/vc:/opt/vc \ 
  --net=host \
  --privileged \
  djhofmann/rpiplay
```
- Mounting the `/opt/vc` folder gives that container access to native apis of the raspberry pi (this requires privileged mode).
- Host network is obviously required. 

### Environment variables
You may provide the following environment variables

| Variable | Description | Default |
| -------- | ----------- | ------- |       
|RPI_PLAY_AUDIO |RPiPlay audio mode |hdmi |
|RPI_PLAY_NAME |Network name |RPiPlay |
|RPI_PLAY_EXTRA_ARGS |Extra args (e.g. `-l`) |*none* |

Please also see the [RPiPlay Usage documentation](https://github.com/FD-/RPiPlay#usage).

## Tested platforms

| Hardware | OS |
| -------- | -- |
|Raspberry Pi 4B (4GB) |[Hypriot OS](https://blog.hypriot.com/) 1.11.4 |
|Raspberry Pi 3B |[Hypriot OS](https://blog.hypriot.com/) 1.10.0 |

Please keep in mind that this image is not guaranteed to run on any platform that theoretically should be supported.

## Please note
This project is not under active maintenance and probably not the ultimate solution for the problem - It originated out of personal need and interest.

I published it, to eventually help somebody.

Also, a **huge thank you** to the awesome people who made this awesome software - I basically only copied it.
