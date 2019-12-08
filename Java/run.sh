# **************************************************************************** #
#                                                                              #
#                                                     -------------------      #
#    run.sh                                           |     ___________ | J    #
#                                                     |    / ____/ ___/ | E    #
#    By: jeremy <jeremyeudy@gmail.com>                |   / /_   \__ \  | R    #
#                                                     |  / __/  ___/ /  | E    #
#    Created: 2019/12/07 20:18:40 by jeremy           | /_/    /____/   | M    #
#    Updated: 2019/12/07 20:18:42 by jeremy           |                 | Y    #
#                                                     -------------------      #
#                                                                              #
# **************************************************************************** #
#!/usr/bin/env bash

FILE="$(basename -- $PWD)"
cd src/classes/
clear
java $FILE.$1
