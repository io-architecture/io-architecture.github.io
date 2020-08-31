#!/usr/bin/env python
import os
import sys


def main(fname):
    out_fname = fname.replace("./", "./docs/")
    out_path = os.path.dirname(out_fname)
    if not os.path.exists(out_path):
        os.makedirs(out_path, exist_ok=True)
    sys.stdout.write(out_fname.replace(".md", ".html"))


if __name__ == "__main__":
    main(sys.argv[1])
