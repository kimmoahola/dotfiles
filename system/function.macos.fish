# Open man page as PDF

function manpdf
  man -t "$argv" | open -f -a /Applications/Preview.app/
end
