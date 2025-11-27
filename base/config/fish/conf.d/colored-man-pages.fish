if status is-interactive
    #  http://linuxtidbits.wordpress.com/2009/03/23/less-colors-for-man-pages/
    set -gx PAGER less
    # https://fishshell.com/docs/current/language.html#escaping-characters
    # enter_blink_mode
    set -gx LESS_TERMCAP_mb \e\[01\;31m
    # enter_bold_mode
    set -gx LESS_TERMCAP_md \e\[01\;38\;5\;74m
    # enter_standout_mode
    set -gx LESS_TERMCAP_so \e\[38\;5\;016m\e\[48\;5\;220m
    # enter_underline_mode
    set -gx LESS_TERMCAP_us \e\[04\;38\;5\;146m
    # exit_attribute_mode
    set -gx LESS_TERMCAP_me \e\[0m
    # exit_standout_mode
    set -gx LESS_TERMCAP_se \e\[0m
    # exit_underline_mode
    set -gx LESS_TERMCAP_ue \e\[0m
    set -gx MANROFFOPT "-c"

    # option RAW-CONTROL-CHARS en majuscules qui passe uniquement les codes de couleur
    # open no-init pour éviter d'effacer l'écran en quittant less
    set -gx LESS "--quit-at-eof --ignore-case --long-prompt --RAW-CONTROL-CHARS --no-init"
end
