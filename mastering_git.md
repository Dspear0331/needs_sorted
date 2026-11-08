# Date: 2026-11-04
---
# [Goal]
Confirm that you can see Sarah's story and history of commits
create a Pull Request(PR) to merge Max's story/fox-and-grapes branch into the master branch
add story to the master branch, reviewed. 
review and approve the PR as user Tom


# [Pseudocode]


# [To-Do-List]

- [pull request]
Click on the Gitea UI button on the top bar. You should be able to access the Gitea page.

UI login info:

- Username: max

- Password: <redacted>

* PR title : Added fox-and-grapes story

* PR pull from branch: story/fox-and-grapes (source)

* PR merge into branch: master (destination)

- [Add tom as reviewer through the Git Portal UI]
* Go to the newly created PR
* Click on Reviewers on the right
* Add tom as a reviewer to the PR
 
 Username: tom

- Password: <redacted>

PR title : Added fox-and-grapes story

Review and merge it.

# [Edges]
- Edge: []
- Fix: []

# [Status: Success / Failure]
- Notes:

# Date: 2026-11-04
---
# [Goal]
The Nautilus application development team was working on a git repository /usr/src/kodekloudrepos/blog present on Storage server in Stratos DC. One of the developers stashed some in-progress changes in this repository, but now they want to restore some of the stashed changes. Find below more details to accomplish this task:


Look for the stashed changes under /usr/src/kodekloudrepos/blog git repository, and restore the stash with stash@{1} identifier. Further, commit and push your changes to the origin.


# [Pseudocode]
- connect
- check
- revert
- check
- add
- commit
- push

# [To-Do-List]

- [connect to host]
```bash
ssh natasha@ststor01
```
- [check]
```bash
# ensures there are no unintended uncommitted stages
git status
```
- [revert]
```bash
git stash pop stash@{1}
```
- [check]
```bash
git status
```

- [add]
```bash
git commit "reverted to stash@{1}"
```

- [push]
```bash
git push
```
# [Edges]
- Edge: []
- Fix: []

# [Status: Success ]
- Notes:
