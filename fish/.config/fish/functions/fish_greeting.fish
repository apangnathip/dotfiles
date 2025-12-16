function fish_greeting
  if test (count (pgrep fish)) -le 2
    echo
    fastfetch
  end
end
