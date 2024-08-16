# Express.js Project Setup PowerShell Script

This PowerShell script automates the setup of a new Node.js project. It creates a new directory, initializes a Node.js project, configures `package.json`, and sets up a basic Express.js server with Nodemon for development.

## Script Overview

The script performs the following tasks:

1. **Input Folder Name**: Prompts the user to enter the name for a new folder.
2. **Create New Folder**: Creates the specified folder.
3. **Navigate into Folder**: Changes the working directory to the newly created folder.
4. **Create `app.js` File**: Generates a basic Express.js application in `app.js`.
5. **Initialize npm**: Creates a default `package.json` file using `npm init -y`.
6. **Update `package.json`**: Adds `"type": "module"` and updates the `"scripts"` section.
7. **Install Dependencies**: Installs `nodemon` as a development dependency and `express@5.0.0-alpha.8` as a runtime dependency.
8. **Restore Execution Policy**: Resets the PowerShell execution policy to its original state.

## Prerequisites

- PowerShell
- Node.js and npm installed on your system

## Script Usage

1. **Save the Script**: Save the script to a file named `setup_project.ps1`.

2. **Run the Script**:
   - Open PowerShell as an Administrator.
   - Navigate to the directory where `setup_project.ps1` is saved.
   - Execute the script by running:
     ```powershell .\setup_project.ps1```

3. **Follow the Prompts**:
   - You will be prompted to enter the name of the new folder that you want to be created. Provide the desired name.



## Notes

- Ensure that you have the appropriate permissions to run scripts and modify the execution policy.
- Change the author name in the script.
- The script temporarily changes the execution policy to bypass restrictions. This is reset to its original state after execution.

## License

This script is licensed under the MIT License. See the [MIT License](https://opensource.org/license/mit) file for more details.
