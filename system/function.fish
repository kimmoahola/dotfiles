
function prepend-path
  if test -d $argv
    set -x -g PATH $argv $PATH
  end
end

function calc
  echo $argv | bc -l
end
