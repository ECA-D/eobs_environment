"""
Only works on ATOS, to run:
module load python3
export TYKKY_PATH=$HPCPERM/tykky
time python3 create_tykky_env.py -n eobs_v25.07

Installing with tykky on atos is a bit tricky, since conda-containerize changes paths during the installation, so we need to have absolute paths.
For that reason, we convert the conda-requirements to a yaml file.
"""

import os
import argparse
import tempfile
import pathlib


FILE_PATH = str(pathlib.Path(__file__).parent.resolve())

template = """
module load tykky
conda-containerize new --mamba --prefix {tykky_path}/{env_name} {yaml_file}
conda-containerize update {tykky_path}/{env_name} --post-install {abs_path}/install_step1_R.sh
"""
yaml_template = """
channels:
  - conda-forge
dependencies:
  - python=3.11.6
"""


def write_requirements_to_yaml(write_to: str):

    content = str(yaml_template)
    with open(os.path.join(FILE_PATH, 'conda_env.txt'), 'r') as f:
        content += '\n  - '.join(f.read().split('\n')[::-1])
    with open(write_to, 'w') as f:
        f.write(content)


def write_script(env_name: str, yaml_file: str, script_path: str):
    content = template.format(tykky_path=os.environ.get('TYKKY_PATH'),
                              env_name=env_name,
                              yaml_file=yaml_file,
                              abs_path=FILE_PATH,
                              )
    with open(script_path, 'w') as f:
        f.write(content)


def main(args):
    temp_dir = args.temp_dir or tempfile.mkdtemp()
    os.chmod(temp_dir, 0o775)
    yaml_file = os.path.join(temp_dir, 'conda_env.yaml')
    write_requirements_to_yaml(yaml_file)

    script_file = os.path.join(temp_dir, f'install_{args.name}.sh')
    write_script(env_name=args.name, yaml_file=yaml_file,
                 script_path=script_file, )
    print(f'bash {script_file}')
    if not args.dry_run:
        os.system(f'bash {script_file}')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(
        description="Write (and exectue) script for creating tykky environment on atos")
    parser.add_argument("-temp_dir", help="Path for writing temporary files", )
    parser.add_argument("-n", "--name", help='environment name',
                        default='py311_R', type=str)
    parser.add_argument(
        "-d", "--dry_run",
        help='do not actually run the command, only write the scripts',
        action='store_true')
    args = parser.parse_args()
    main(args)
