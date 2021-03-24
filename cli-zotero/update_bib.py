"""
Download all colelctions in my Zotero library as bib files
Requires pyzotero
Run as

conda activate pyzotero
python /Users/alexajo/github/cli-zotero/cli-zotero.py --user 3965838 --list-collections |  python update_bib.py
"""

import sys
import subprocess

def run_command(command):
    """
    Executes a command on the shell
    """
    # return # for skipping
    process = subprocess.Popen([command], stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell = True)
    out, err = process.communicate()
    if out: print("out:", out)
    if err: print("err:", err)


def update_bibs(zoteroInfo):
    """
    Uses cli-zotero.py to download collections as bib files
    """
    for line in zoteroInfo:
        ID_num, name = line.strip().split(' - ')
        # see https://stackoverflow.com/a/31110377/462692 for why PYTHONIOENCODING=utf-8
        cmd = 'PYTHONIOENCODING=utf-8 python /Users/alexajo/github/cli-zotero/cli-zotero.py --user 3965838'
        cmd += " --collection-to-bibtex %s >%s.bib" %(ID_num, name)
        print(cmd)
        run_command(cmd)


if __name__ == "__main__":
    update_bibs(sys.stdin)
