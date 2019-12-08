# **************************************************************************** #
#                                                                              #
#                                                     -------------------      #
#    setup.sh                                         |     ___________ | J    #
#                                                     |    / ____/ ___/ | E    #
#    By: jeremy <jeremyeudy@gmail.com>                |   / /_   \__ \  | R    #
#                                                     |  / __/  ___/ /  | E    #
#    Created: 2019/12/07 20:18:49 by jeremy           | /_/    /____/   | M    #
#    Updated: 2019/12/07 20:18:52 by jeremy           |                 | Y    #
#                                                     -------------------      #
#                                                                              #
# **************************************************************************** #
#!/usr/bin/env bash

clear
mkdir -p src/
cd src/
mkdir -p classes/
mkdir -p files/
cd ..
chmod +x run.sh
chmod +x build.sh
cd src/

{

	javac -cp classes/ -d classes/ files/*.java && 
		echo "Setup finished." && echo "Use './run.sh' to run";

} || {

	echo "Build failed.";

}
