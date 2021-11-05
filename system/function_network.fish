# Webserver

function srv
  test -n "$argv"; or set argv "."
  set PORT (get-port)
  open "http://localhost:"$PORT
  python -m http.server --directory "$argv" "$PORT"
end

# Upload file to transfer.sh
# https://github.com/dutchcoders/transfer.sh/

function transfer
  if test (count $argv) -eq 0
    echo "No arguments specified. Usage:"
    echo "transfer /tmp/test.md"
    return 1
  end

  ## get temporarily filename, output is written to this file so progress can be showed
  set tmpfile ( mktemp -t transferXXX )

  ## upload stdin or file
  set file $argv[1]

  set basefile (basename "$file" | sed -e 's/[^a-zA-Z0-9._-]/-/g')

  if test -d $file
    # zip directory and transfer
    echo "zipping directory..."
    set zipfile ( mktemp -t transferXXX.zip )
    zip -r -q - $file >> $zipfile
    echo "uploading..."
    curl --progress-bar --upload-file "$zipfile" "https://transfer.sh/$basefile.zip" >> $tmpfile
    rm -f $zipfile
  else
    # transfer file
    echo "uploading..."
    curl --progress-bar --upload-file "$file" "https://transfer.sh/$basefile" >> $tmpfile
  end

  # newline to the end
  echo >> $tmpfile

  ## cat output link
  cat $tmpfile

  ## cleanup
  rm -f $tmpfile
end

function host-headers
  curl --insecure -s -v -o /dev/null "$argv"
end

function view-cert-file
  openssl x509 -in "$argv" -noout -text
end

function listening

  if is-macos
    sudo lsof -nP -i4TCP | egrep 'COMMAND|LISTEN'
  end

  if is-ubuntu
    sudo netstat -pant | egrep 'Proto|LISTEN'
    # OR: sudo ss -ltp
  end

end
