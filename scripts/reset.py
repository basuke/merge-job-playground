#!/usr/bin/python

import argparse
from git import Repo


def reset(repo: Repo) -> None:
    """
    Create a commit which will conflict on next merge.
    """
    repo.git.checkout("main")
    repo.git.fetch(all=True, prune=True)

    merge_branches = [branch.name for branch in repo.branches if branch.name.startswith("merge/")]
    for branch in merge_branches:
        repo.git.branch('-D', branch)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        "Reset git environment."
    )
    args = parser.parse_args()
    repo = Repo(".")
    reset(repo)

