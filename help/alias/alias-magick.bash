# identify comes from mingw-w64-x86_64-imagemagick
export resize="-resize 2048x2048\>"
#export quality="-quality 80"   commented out because global size is not reduced
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export NC='\033[0m' # No Color

function pascal-magik-identify() {
  FULLFILENAME=$1    # full name of the image to resize
  DSTDIR=$2          # rootbase dir to copy to
  DIRNAME=`dirname $FULLFILENAME`
  FILENAME=`basename $FULLFILENAME`
  #export MAGICKEXTENSION=${FULLFILENAME##*.}
  #export MAGICKEXTENSION=`magick identify -format "%m" $FULLFILENAME`
  mkdir -p "$DSTDIR/$DIRNAME"
  if [[ "$FILENAME" =~ ^[0-9]{8}[-_][0-9]{6} ]]; then
    # on filename=20260215_085415-IMG_100.png
    #   MAGICKNEWNAME does not change the filename
    CREATIONDATE=$FILENAME
    export MAGICKNEWNAME="$DSTDIR/$DIRNAME/$FILENAME"
  else
    # on filename=IMG_100.png
    #   MAGICKNEWNAME equals something like 20260215_085415-IMG_100.png  when creation date is known
    CREATIONDATE=`magick identify -format '%[exif:datetime]' $FULLFILENAME 2> /dev/null | sed -e 's/://g' -e 's/ /_/g'`
    if [[ -z "$CREATIONDATE" ]]; then
      # CREATIONDATE is empty when cannot be retrieved, so we keep the original filename
      export MAGICKNEWNAME="$DSTDIR/$DIRNAME/$FILENAME"
    else
      export MAGICKNEWNAME="$DSTDIR/$DIRNAME/$CREATIONDATE-$FILENAME"
    fi;
  fi;
  # on CREATIONDATE=20260215-085415-IMG_100.png, MAGICTOUCHTIME is set to 2602150854.15
  # on CREATIONDATE=20251206_183620, MAGICTOUCHTIME is set to 2512061836.20
  export MAGICTOUCHTIME=`echo $CREATIONDATE| sed -e 's/[-_]//g' -e 's/^[0-9]\{2\}\([0-9]\{10\}\)\([0-9]\{2\}\).*$/\1\.\2/g'`
}
export -f pascal-magik-identify

function pascal-magick-final() {
  SRCSIZE=$(stat --format="%s" $1)
  DSTSIZE=$(stat --format="%s" $2)
  if ((SRCSIZE < DSTSIZE)); then
    echo -e "${YELLOW}!!! Keep original as original is smaller (SRCSIZE=$SRCSIZE, DSTSIZE=$DSTSIZE)${NC}"
    cp $1 $2
  fi;

  if [[ ! -z "$MAGICTOUCHTIME" ]]; then
    touch -t $MAGICTOUCHTIME $1
  fi;
}
export -f pascal-magick-final

function pascal-magick-resize-png() {
  echo -e "${GREEN}+++ $1 ==> $2${NC}"
  magick $1 $resize png32:$2
  pascal-magick-final $1 $2
}
export -f pascal-magick-resize-png

function pascal-magick-resize-jpeg() {
  echo -e "${GREEN}+++ $1 ==> $2${NC}"
  magick $1 $resize $quality $2
  pascal-magick-final $1 $2
}
export -f pascal-magick-resize-jpeg

function pascal-magick-resize-heic() {
  echo -e "${GREEN}+++ $1 ==> $2${NC}"
  magick $1 $resize $quality $2
  pascal-magick-final $1 $2
}
export -f pascal-magick-resize-heic

function pascal-magick-resize-image() {
  FULLFILENAME=$1
  DSTDIR=$2
  FILENAME=`basename $FULLFILENAME`
  EXT=${FULLFILENAME##*.}

  # no extension? skip
  if [[ -z "$EXT" || "$EXT" == "$FULLFILENAME" ]]; then
    echo "Skipping $FULLFILENAME because it has no extension"
    return 0
  fi;
  # extension in skip list? skip
  if [[ "$EXT" == "AAE" || "$EXT" == "aae" ]]; then
    return 0
  fi;
  if [[ "$EXT" == "MP4" || "$EXT" == "mp4" ]]; then
    return 0
  fi;
  if [[ "$EXT" == "MOV" || "$EXT" == "mov" ]]; then
    return 0
  fi;
  pascal-magik-identify $FULLFILENAME $DSTDIR
  if [[ ! -f $MAGICKNEWNAME ]]; then
    if [[ "$EXT" == "PNG" || "$EXT" == "png" ]]; then
      pascal-magick-resize-png $FULLFILENAME $MAGICKNEWNAME
    elif [[ "$EXT" == "JPEG" || "$EXT" == "jpeg" || "$EXT" == "JPG" || "$EXT" == "jpg" ]]; then
      pascal-magick-resize-jpeg $FULLFILENAME $MAGICKNEWNAME
    elif [[ "$EXT" == "HEIC" || "$EXT" == "heic" ]]; then
      pascal-magick-resize-heic $FULLFILENAME $MAGICKNEWNAME
    else
      echo -e "${RED}??? Skipping $FULLFILENAME because of unsupported extension (MAGICKEXTENSION=$MAGICKEXTENSION)${NC}"
    fi;
  else
    echo -e "${GREEN}+++ $FULLFILENAME ==> $MAGICKNEWNAME${NC}"
  fi;
}
export -f pascal-magick-resize-image


function pascal-magick-resize-images() {
  SRCDIR=$1
  DSTDIR=$2
  if [ -z "$SRCDIR" ]; then
    SRCDIR="to-reduce"
  fi
  if [ -z "$DSTDIR" ]; then
    DSTDIR="reduced"
  fi
  find $SRCDIR -exec bash -c 'pascal-magick-resize-image "$1" "$2"' _ {} $DSTDIR \;
}
export -f pascal-magick-resize-images



# $ ffprobe  -show_entries stream=index,codec_type:stream_tags=creation_time:format_tags=creation_time /c/Users/pasca/Desktop/ipad/201709_a/I0001709.MP4
# $ ffprobe -v quiet -select_streams v:0  -show_entries stream_tags=creation_time -of default=noprint_wrappers=1:nokey=1  /c/Users/pasca/Desktop/ipad/201709_a/I0001709.MP4
