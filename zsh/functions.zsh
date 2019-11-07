
# bundle grep (for rails)
function bgrep {
  if [ -z "$1" ]; then
    echo "usage: bgrep text-to-search"
    return 1
  fi
  echo "Searching for $1"
  rg -r $1 $(bundle show --paths) .
}

# bundle find (for rails):wq

function bfind {
  if [ -z "$1" ]; then
    echo "usage: bfind file-name-to-search"
    return 1
  fi
  find $(bundle show --paths) -iname "*$1*"
}

