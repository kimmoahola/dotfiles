
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

# Usage:
# cheat tar~list
function cheat
  curl cheat.sh/"$argv"
end

function clean-docker
  docker ps -a | grep 'hours ago' | awk '{print $1}' | xargs docker rm
  docker ps -a | grep '.. minutes ago' | awk '{print $1}' | xargs docker rm
  docker ps -q -a -f status=exited | xargs -n 100 docker rm -v
  docker images -q --filter "dangling=true" | xargs -n 100 docker rmi
  docker images | grep "^<none>" | awk '{print $3}' | xargs docker rmi
end
