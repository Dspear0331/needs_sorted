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

# [Goal]
The Nautilus application development team has been working on a project repository /opt/media.git. This repo is cloned at /usr/src/kodekloudrepos on storage server in Stratos DC. They recently shared the following requirements with DevOps team:


One of the developers is working on feature branch and their work is still in progress, however there are some changes which have been pushed into the master branch, the developer now wants to rebase the feature branch with the master branch without loosing any data from the feature branch, also they don't want to add any merge commit by simply merging the master branch into the feature branch. Accomplish this task as per requirements mentioned.

Also remember to push your changes once done.


# [Pseudocode]
- switch to working space
- status
- fetch origin
- checkout feature
- rebase origin/master
- push

# [To-Do-List]

- [change working space]
```bash
ssh natasha@ststor01
```
- [status]
```bash
git status
```

- [ensure origin]
```bash
git fetch origin/master
```

- [checkout]
```bash
git checkout feature
```

- [rebase]
```bash
git rebase origin/master
```
- [push]
```bash
git push origin <feature-branch-name> --force-with-lease
```

# [Edges]
- Edge: []
- Fix: []

# [Status: Success / Failure]
- Notes:

# [Goal]
Sarah and Max were working on writting some stories which they have pushed to the repository. Max has recently added some new changes and is trying to push them to the repository but he is facing some issues. Below you can find more details:

SSH into storage server using user max and password Max_pass123. Under /home/max you will find the story-blog repository. Try to push the changes to the origin repo and fix the issues. The story-index.txt must have titles for all 4 stories. Additionally, there is a typo in The Lion and the Mooose line where Mooose should be Mouse.

Click on the Gitea UI button on the top bar. You should be able to access the Gitea page. You can login to Gitea server from UI using username sarah and password Sarah_pass123 or username max and password Max_pass123.

Note: For these kind of scenarios requiring changes to be done in a web UI, please take screenshots so that you can share it with us for review in case your task is marked incomplete. You may also consider using a screen recording software such as loom.com to record and share your work.

# [Pseudocode]
- connect
- fix spelling
- add
- commit
- push
- conflict
- fix file <<<<=====>>>> and extra entries
- add
- commit
- push

# [To-Do-List]
- [connect]
```bash
ssh max@ststor01
cd /home/max/story-blog
```
- [fix spelling]
```bash
vi /home/max/story-blog/story-index.txt
```

- [stage,commit and push]
```bash
git add .
git commit -m "Fix typo in story-index.txt"
git push origin master
```
# [Edges]
- Edge: merge conflict
- Fix: 
```bash
git pull origin master
vi /home/max/story-blog/story-index.txt
```
- [stage,commit and push]
```bash
git add .
git commit -m "fixed merge issue"
git push origin master
```
[Status: Success]
Notes: Ensure that when you fix the merge that you are retesting with the pipeline and that the right update is being implemented

# [Goal]
The Nautilus application development team was working on a git repository /opt/cluster.git which is cloned under /usr/src/kodekloudrepos directory present on Storage server in Stratos DC. The team want to setup a hook on this repository, please find below more details:


    Merge the feature branch into the master branch, but before pushing your changes complete below point.

    Create a post-update hook in this git repository so that whenever any changes are pushed to the master branch, it creates a release tag with name release-2023-06-15, where 2023-06-15 is supposed to be the current date. For example if today is 20th June, 2023 then the release tag must be release-2023-06-20. Make sure you test the hook at least once and create a release tag for today's release.

    Finally remember to push your changes.
    Note: Perform this task using the natasha user, and ensure the repository or existing directory permissions are not altered.



'''bash
git branch
git switch master
git merge feature

#!/usr/bin/sh

# address
refname="$1"
#past state
oldrev="$2"
#future state
newref="$3"
#current date
current_date=$(date +"%Y-%m-%d")
release_name=release-"$current_date"
if [ "refname" = "refs/heads/master" ] ; then
 mkdir -p "$PWD/$release_name"
 echo "Created release directory at: $PWD/release_name"
 fi

