
function prepend-path
  if test -d $argv
    if status is-interactive
      set -x -g PATH $argv $PATH
    end
  end
end

function calc
  echo $argv | bc -l
end
