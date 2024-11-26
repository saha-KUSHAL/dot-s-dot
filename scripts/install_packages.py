import subprocess

def run_command(command, return_output=True):
    # Run command
    output = subprocess.run(command, shell=True, capture_output=True, text=True)

    if output.returncode == 0 and return_output:
        return output.stdout
    else:
        return output.stderr

def read_package_file(path):
    # open the file
    file = open(path, 'r')
    packages = file.readlines()

    return packages

def install_packages(packages, manager, root = False):
    options = ' -S --noconfirm --norebuild '

    for package in packages:
        command = manager + options + package
        print(f'Installing {package}')
        if root:
            command = 'sudo ' + command

        print(run_command(command, return_output=False))

path = './packages/linux.txt'

packages = read_package_file(path)
install_packages(packages=packages, manager='yay')
