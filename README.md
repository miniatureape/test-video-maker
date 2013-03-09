testvideo.sh
===========

Creates webm test videos from the command line. This is useful for testing things like a video slideshow where the order is important.

To use, install ffmpeg according to these instructions: https://ffmpeg.org/trac/ffmpeg/wiki/UbuntuCompilationGuide

Then: 

```bash
./testvideo
```

To change the caption in the video, use the name options:

```bash
./testvideo -n my-vid
```

To change the duration in seconds, use the -d option:

```bash
./testvideo -d 10
```
Specify output file

```bash
./testvideo -d 10 my-file
```

will produce a 10 second long video called my-file
