#!/usr/bin/env bash
# Copyright 2021  Jiayu Du
#                 Seasalt AI, Inc (Author: Guoguo Chen)


set -e

if [ $# -ne 1 ]; then
  echo "Usage: $0 <gigaspeech-dataset-local-dir>"
  echo " e.g.: $0 /disk1/audio_data/gigaspeech"
  echo ""
  echo "This script downloads the GigaSpeech meta file (a.k.a 'GigaSpeech.json)'"
  echo "to your local <gigaspeech-dataset-local-dir>/GigaSpeech.json."
  echo "Meta file contains audio sources, segmentation information, labels, etc."
  exit 1
fi


dir=$1

[ `uname -s` == 'Linux' ] && ossbin=tools/downloader/ossutil64
[ `uname -s` == 'Darwin' ] && ossbin=tools/downloader/ossutilmac64

$ossbin -c SAFEBOX/aliyun_ossutil.cfg \
  cp ${GIGA_SPEECH_RELEASE_URL}/GigaSpeech.json \
  $dir/GigaSpeech.json || exit 1

echo "$0: Done"
