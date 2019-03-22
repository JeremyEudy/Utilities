#Author: jeremy

from subprocess import call

print( "##########################################")
print( "#                                        #")
print( "#        Install Script Builder          #")
print( "#                                        #")
print( "##########################################")
print("This will place the install script in the current directory.")
print("Install as root?")
print("1 - Yes")
print("2 - No")
root = input("")

if(root == 1):
    root = "sudo "
else:
    root = ""

print("Dependencies:")
print( "Which package managers are you going to use? (0 to finish choosing)")
print("1 - apt")
print("2 - homebrew")
print("3 - flatpak")
print("4 - yum")
print("5 - pacman")
print("6 - pip3")
print("7 - dpkg")

pkg_list = {1 : "apt", 2 : "homebrew", 3 : "flatpak", 4  : "yum",
            5 : "pacman", 6 : "pip3", 7 : "dpkg"}

pkg_mngrs = []

f = open("setup.sh", "w")
f.write("#-----------------------\n")
f.write("#Installs dependencies |\n")
f.write("#-----------------------\n\n")

while(True):
    u_input = int(input(">"))
    if(u_input == 0):
        break
    else:
        pkg_mngrs.append(u_input)

for i in range(0, len(pkg_mngrs)):
    print("Enter packages for {} (0 to finish)".format(pkg_list[pkg_mngrs[i]]))
    while(True):
        u_input = str(input(">"))
        if(u_input == "0"):
            break
        else:
            if(pkg_mngrs[i] == 1):
                f.write("{}apt install -y {}\n".format(root, u_input))
            elif(pkg_mngrs[i] == 2):
                f.write("{}brew install {}\n".format(root, u_input))
            elif(pkg_mngrs[i] == 3):
                f.write("{}flatpak install {}\n".format(root, u_input))
            elif(pkg_mngrs[i] == 4):
                f.write("{}yum install -y {}\n".format(root, u_input))
            elif(pkg_mngrs[i] == 5):
                f.write("{}pacman -S {}\n".format(root, u_input))
            elif(pkg_mngrs[i] == 6):
                f.write("{}pip3 install {}\n".format(root, u_input))
            elif(pkg_mngrs[i] == 7):
                f.write("{}dpkg -i {}\n".format(root, u_input))

print("Commands:")
print("Input commands to be appended to setup file: (0 to end; prepend sudo where necessary)")
f.write("\n#----------\n")
f.write("#Commands |\n")
f.write("#----------\n\n")
while(True):
    u_input = str(input(">"))
    if(u_input == "0"):
        break
    else:
        f.write("{}".format(u_input))
        f.write("\n")

f.close()
call(["chmod", "+x", "setup.sh"])
print("File saved as setup.sh")
