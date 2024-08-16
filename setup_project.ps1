# Save the current execution policy
$currentExecutionPolicy = Get-ExecutionPolicy

# Temporarily set the execution policy to Bypass
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force

try {
    # 1. Input folder name
    $folderName = Read-Host "Enter the name for the new folder"

    # 2. Create new folder
    New-Item -Path $folderName -ItemType Directory

    # 3. Navigate into new folder
    Set-Location -Path $folderName

    # 4. Create app.js file with given code
    $appJsContent = @'
import express from "express";
const app = express();
const port = process.env.PORT || 3000;

app.get("/", (req, res) => {
  res.send("Hello World");
});

app.listen(port, () => {
  console.log(`Server listening at http://localhost:${port}`);
});
'@
# 5. Set the content of new folder
    Set-Content -Path "app.js" -Value $appJsContent

    
# 6. Initialize npm and it creates the package.json file
    npm init -y

# 7. Read the existing package.json content
    $packageJson = Get-Content -Path "package.json" -Raw | ConvertFrom-Json

# 8. Create a new object with the additional "type" and updated "scripts" properties
    $updatedPackageJson = [PSCustomObject]@{
        name        = $packageJson.name
        version     = $packageJson.version
        description = $packageJson.description
        main        = $packageJson.main
        type        = "module"
        scripts     = @{
            dev   = "nodemon app"
            start = "node app"
        }
        keywords    = $packageJson.keywords
        author      = "Anshu Singh"
        license     = $packageJson.license
    }

# 9. Convert the updated object back to JSON with proper formatting and write it to package.json
    $jsonOutput = $updatedPackageJson | ConvertTo-Json -Depth 3 | Out-String
    $jsonOutput | Set-Content -Path "package.json"

# 10. Install devDependency -nodemon and dependencies - express
    
    npm install -D nodemon
    npm install express@5.0.0-alpha.8

    Write-Host "Setup complete!"
} finally {
    # Restore the original execution policy
    Set-ExecutionPolicy -Scope Process -ExecutionPolicy $currentExecutionPolicy -Force
}
