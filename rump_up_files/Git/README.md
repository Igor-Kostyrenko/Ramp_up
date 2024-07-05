<p align="left">
 <img width="400px" src="Logo.png" alt="qr"/>
</p>


## Git: Overview and Basic Commands

Git is a distributed version control system designed to handle everything from small to very large projects with speed and efficiency. Here are some key aspects and commands of Git:

### Overview

- **Version History:** Git keeps track of changes made to files, allowing you to revert to previous versions if needed.
- **Distributed Development:** Every developer has a complete copy of the repository, including its full history.
- **Branching and Merging:** Git allows multiple people to work on a project simultaneously by using branches, which can later be merged together.
- **Staging Area:** Changes can be reviewed and modified before they are committed to the repository.

### Basic Components

1. **Repository:** The storage location for your project, containing all files and their history.
2. **Commit:** A snapshot of your project at a specific point in time.
3. **Branch:** A parallel version of your project, used for developing features or testing changes.
4. **Remote:** A version of your project that is hosted on the internet or another network.
5. **Staging Area (Index):** A temporary storage area where changes are reviewed before committing.

### Basic Commands

- **`git init`:** Initialize a new Git repository.
- **`git clone [url]`:** Clone a repository from a remote server.
- **`git status`:** Check the status of your working directory and staging area.
- **`git add [file]`:** Add files to the staging area.
- **`git commit -m "[message]"`:** Commit changes to the repository with a message.
- **`git push [remote] [branch]`:** Push changes to a remote repository.
- **`git pull [remote] [branch]`:** Pull changes from a remote repository.
- **`git branch`:** List, create, or delete branches.
- **`git checkout [branch]`:** Switch to a different branch.
- **`git merge [branch]`:** Merge a branch into the current branch.
- **`git log`:** View the commit history.
- **`git diff`:** Show changes between commits, commit and working tree, etc.

### Usage Example

To start a new project with Git:

1. **Initialize a repository:**
    ```sh
    git init
    ```

2. **Add files to the repository:**
    ```sh
    git add .
    ```

3. **Commit the changes:**
    ```sh
    git commit -m "Initial commit"
    ```

4. **Create a new branch:**
    ```sh
    git branch new-feature
    ```

5. **Switch to the new branch:**
    ```sh
    git checkout new-feature
    ```

6. **Push the changes to a remote repository:**
    ```sh
    git push origin new-feature
    ```

