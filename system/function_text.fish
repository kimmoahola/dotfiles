# Show duplicate/unique lines
# Source: https://github.com/ain/.dotfiles/commit/967a2e65a44708449b6e93f87daa2721929cb87a

function duplines
  sort $argv | uniq -d
end

function uniqlines
  sort $argv | uniq -u
end
