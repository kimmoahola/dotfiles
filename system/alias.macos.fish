# Copy pwd to clipboard

alias cpwd="pwd|tr -d '\n'|pbcopy"


# Recursively remove Apple meta files

alias cleanupds="find . -type f -name '*.DS_Store' -ls -delete"
alias cleanupad="find . -type d -name '.AppleD*' -ls -delete"
