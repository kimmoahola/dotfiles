# Fuzzy find file/dir

function ff
  find . -type f -iname "$argv"
end

function fff
  find . -type f -iname "*$argv*"
end

function fd
  find . -type d -iname "$argv"
end

function fdf
  find . -type d -iname "*$argv*"
end

# Show disk usage of current folder, or list with depth

function duf
  test -n "$argv"; or set argv 1
  du --max-depth=$argv -c | sort -r -n | awk '{split("K M G",v); s=1; while($1>1024){$1/=1024; s++} print int($1)v[s]"\t"$2}'
end

# Check if resource is served compressed

function check-compression
  curl --insecure --write-out 'Size (uncompressed) = %{size_download}\n' --silent --output /dev/null $argv
  curl --insecure --header 'Accept-Encoding: gzip,deflate,compress' --write-out 'Size (compressed) =   %{size_download}\n' --silent --output /dev/null $argv
  curl --insecure --head --header 'Accept-Encoding: gzip,deflate' --silent $argv | grep -i "cache\|content\|vary\|expires" --color=NEVER
end

# Get gzipped file size

function gz
  set -l  ORIGSIZE (wc -c < "$argv")
  set -l  GZIPSIZE (gzip -c "$argv" | wc -c)
  set -l  RATIO (echo "$GZIPSIZE * 100/ $ORIGSIZE" | bc -l)
  set -l  SAVED (echo "($ORIGSIZE - $GZIPSIZE) * 100/ $ORIGSIZE" | bc -l)
  printf "orig: %d bytes\ngzip: %d bytes\nsave: %2.0f%% (%2.0f%%)\n" "$ORIGSIZE" "$GZIPSIZE" "$SAVED" "$RATIO"
end

# Create a data URL from a file

function dataurl
  set -l MIMETYPE (file --mime-type "$argv" | cut -d ' ' -f2)
  if [ $MIMETYPE = "text/*" ]
    set -l MIMETYPE "$MIMETYPE;charset=utf-8"
  end
  echo "data:$MIMETYPE;base64,"(openssl base64 -in "$argv" | tr -d '\n')
end
