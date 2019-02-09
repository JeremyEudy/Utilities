# **************************************************************************** #
#                                                                              #
#                                                             |\               #
#    build.sh                                           ------| \----          #
#                                                       |    \`  \  |  p       #
#    By: jeudy2552 <jeudy2552@floridapoly.edu>          |  \`-\   \ |  o       #
#                                                       |---\  \   `|  l       #
#    Created: 2018/11/19 14:28:25 by jeudy2552          | ` .\  \   |  y       #
#    Updated: 2018/11/19 14:28:40 by jeudy2552          -------------          #
#																			   #
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
