# **************************************************************************** #
#                                                                              #
#                                                     -------------------      #
#    build.sh                                         |     ___________ | J    #
#                                                     |    / ____/ ___/ | E    #
#    By: jeremy <jeremyeudy@gmail.com>                |   / /_   \__ \  | R    #
#                                                     |  / __/  ___/ /  | E    #
#    Created: 2019/12/07 20:18:20 by jeremy           | /_/    /____/   | M    #
#    Updated: 2019/12/07 20:18:24 by jeremy           |                 | Y    #
#                                                     -------------------      #
#                                                                              #
# **************************************************************************** #
#!/usr/bin/env bash

clear
cd src/
rm -r classes/
mkdir -p classes/

{

	javac -cp classes/ -d classes/ files/*.java &&
		echo "Build complete" && echo "Use './run' to launch";
	

} || {

	echo "Build failed.";

}
