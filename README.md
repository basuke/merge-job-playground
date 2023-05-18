# Sample Project for Merge Job Development

This is a sample project for merge job development. You should have two branches, `main` and `develop`. The `main` branch is the open-source version and the `develop` branch is the branch for downstream.

Intermediate merge branches are created on demand. For example, `merge/badbeef` is created for the merge job which is merging the commit with the hash `badbeef`. The `merge/badbeef` branch is merged into the `develop` branch and is deleted after that.

When build error happens, then merge branch is not merged and not deleted. You can check the build error by checking the `merge/badbeef` branch.

## How to use

TBD. I don't know how to use this project yet.
