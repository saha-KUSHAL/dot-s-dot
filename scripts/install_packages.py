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

def install_packages(packages, manager, options, root = False,):
    if len(packages) == 0:
        print(f'No {manager} packages found.')
        exit()
    for package in packages:
        command = manager + options + package
        print(f'Installing {package}')
        if root:
            command = 'sudo ' + command

        print(run_command(command, return_output=False))

pacman_path = './packages/pacman.txt'
aur_path = './packages/aur.txt'

pacman_packages = read_package_file(pacman_path)
aur_packages = read_package_file(aur_path)

print('--- Installing Pacman packages ---')
install_packages(packages=pacman_packages, manager='pacman', root=True, options=' -S --noconfirm --needed ')

print('--- Installing AUR packages ---')
install_packages(packages=aur_packages, manager='aur', options=' -S --noconfirm --norebuild ')
