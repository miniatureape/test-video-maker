#!/bin/bash
video_name="video_1"
duration=3

while getopts ":n:d" opt; do
  case $opt in
    n)
      video_name=$OPTARG
      ;;
    d)
      duration=$OPTARG
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

shift $(($OPTIND - 1))
output_file=${1:-out.mp4}

function createFrames() {
    for i in $(seq -f "%03g" 1 $2)
    do
       convert -size 1920x1080 xc:#ffffff -pointsize 48 -gravity center -draw "text 0,0 'video: ${1} second: $i'" /tmp/$i-frame.jpg
    done
}

createFrames ${video_name} ${duration}
ffmpeg -f image2 -r 1  -i '/tmp/%03d-frame.jpg' -c:v libx264 $output_file
rm /tmp/*-frame.jpg
