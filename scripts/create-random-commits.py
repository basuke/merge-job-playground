# python script to generate random commits
# using GitPython

import argparse
from git import Repo
from faker import Faker


fake = Faker()


def create_and_push_random_commits(repo: Repo, count: int) -> None:
    """
    Create random commits and push changes to upstream.
    """
    # Checkout main branch
    repo.git.checkout("main")

    # Create random commits
    for _ in range(count):
        create_random_commit(repo)

    # Push changes to upstream
    repo.git.push("upstream", "main")


def create_random_commit(repo: Repo) -> None:
    """
    Add random change to README.md and commit the change with random commit message.
    """
    title = fake.catch_phrase()

    section = f"""
## {title}

{fake.paragraph()}
"""
    # Add random change to README.md
    with open("README.md", "a") as f:
        f.write(section)

    # Commit the change
    repo.git.add("README.md")
    repo.git.commit("-m", title)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        "Create random commits on main and push changes to upstream."
    )
    parser.add_argument("--count", "-c", type=int, default=1)
    args = parser.parse_args()

    create_and_push_random_commits(Repo("."), args.count)
