#!/usr/bin/env bash
# **************************************************************************** #
#                                                                              #
#                                                             |\               #
#    setup.sh                                           ------| \----          #
#                                                       |    \`  \  |  p       #
#    By: jeudy2552 <jeudy2552@floridapoly.edu>          |  \`-\   \ |  o       #
#                                                       |---\  \   `|  l       #
#    Created: 2018/05/31 21:38:14 by jeudy2552          | ` .\  \   |  y       #
#    Updated: 2018/05/31 21:38:14 by jeudy2552          -------------          #
#                                                                              #
# **************************************************************************** #

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
