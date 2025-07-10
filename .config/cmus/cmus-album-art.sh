#!/usr/bin/sh

#QUERY=$( cmus-remote -Q )
#echo "$QUERY"
#exit
#dunstify -C 9999

STATUS=$( cmus-remote -Q | grep 'status' | sed 's/status //' )
POSITION=$( cmus-remote -Q | grep 'position' | sed 's/position //' )

#[[ $STATUS == 'playing' ]] && [[ $POSITION == '0' ]] || [[ $1 == 'force' ]] || exit
[ "$STATUS" = 'playing' ] && [ "$POSITION" = '0' ] || [ "$1" = 'force' ] || exit
#[[ $STATUS == 'playing' ]] || exit

FILE=$( cmus-remote -Q | grep 'file' | sed 's/file //' )

#[[ -z /tmp/cmus ]] || mkdir /tmp/cmus
[ -z "/tmp/cmus" ] || mkdir /tmp/cmus

ARTIST=$( cmus-remote -Q | grep 'artist' | sed 's/tag artist //' | head -1 )
SONG=$( cmus-remote -Q | grep 'title' | sed 's/tag title //' )

# To remove or not to remove the file, that is the question.
ffmpeg -y -i "$FILE" /tmp/cmus/preview.png && \
dunstify -h int:transient:1 -a " C*Mus" "Now Playing:" "$(echo $ARTIST) - $(echo $SONG)" -t -1 -r 9999 -i /tmp/cmus/preview.png || \
dunstify -h int:transient:1 -a " C*Mus" "Now Playing:" "$(echo $ARTIST) - $(echo $SONG)" -t -1 -r 9999

#notify-send -a " C*Mus" "Now Playing:" "$(echo $ARTIST) - $(echo $SONG)" -t -1 -i /tmp/cmus/preview.png || \
#notify-send -a " C*Mus" "Now Playing:" "$(echo $ARTIST) - $(echo $SONG)" -t -1
#echo $FILE

#TODO: Don't use the position of metadata to get the attributes (artist vs albumArtist)
#TODO: use arguments to circumvent the POSITION=0 and force notification
