# Terraform Beginner's Guide: Complete Setup from Zero

## ⚠️ Before You Start - Important Warnings

### 🚫 WHAT NOT TO USE:
- **DO NOT** use online IDEs (Replit, Cloud9, CodePen, etc.)
- **DO NOT** use mobile devices or tablets
- **DO NOT** use school/library computers with restrictions
- **DO NOT** modify the `.gitignore` file we provide
- **DO NOT** use your AWS root account credentials

### ✅ WHAT TO USE:
- **Windows**: **Git Bash** (recommended) or PowerShell
- **Mac**: Use **Terminal** 
- **All Systems**: **VS Code** as your text editor

---

## Phase 1: Install Required Software

### Step 1: Install Git Bash (Windows Users Only)

1. Go to [git-scm.com](https://git-scm.com/)
2. Click "Download for Windows"
3. Run the installer with **ALL DEFAULT SETTINGS**
4. When asked "Choosing the default editor", select "Use Visual Studio Code as Git's default editor"
5. Complete installation and restart your computer

### Step 2: Install Visual Studio Code

1. Go to [code.visualstudio.com](https://code.visualstudio.com/)
2. Click "Download for Windows/Mac"
3. Run installer with default settings
4. Open VS Code after installation

### Step 3: Install Terraform

#### For Windows (Git Bash):
```bash
# Download Terraform
curl -o terraform.zip https://releases.hashicorp.com/terraform/1.5.7/terraform_1.5.7_windows_amd64.zip

# Extract it
unzip terraform.zip

# Move to system path
mkdir -p /c/terraform
mv terraform.exe /c/terraform/

# Add to PATH
echo 'export PATH="/c/terraform:$PATH"' >> ~/.bashrc

# Reload your environment
source ~/.bashrc
For Mac (Terminal):
bash
# Install Homebrew first
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Terraform
brew install terraform
Step 4: Verify Terraform Installation
Open Git Bash (Windows) or Terminal (Mac)

Run this command:

bash
terraform version
✅ SUCCESS LOOKS LIKE:

text
Terraform v1.5.7
on windows_amd64
If you see a version number, Terraform is installed correctly!

Phase 2: AWS Account Setup
Step 5: Create AWS Account (If You Don't Have One)
Go to aws.amazon.com

Click "Create an AWS Account"

Follow the sign-up process (you'll need a credit card)

IMPORTANT: Save your root user email and password securely

Step 6: Create IAM User (Security Best Practice)
Login to AWS Console

Search for "IAM" in the search bar

Click "Users" in left sidebar

Click "Add users" button

Enter username: terraform-user

Check "Access key - Programmatic access"

Click "Next: Permissions"

Step 7: Set Permissions
Click "Attach existing policies directly"

Search for "AdministratorAccess"

Check the box next to "AdministratorAccess"

Click "Next: Tags" → "Next: Review"

Click "Create user"

Step 8: Save Your AWS Access Key ID and Secret Access Key ⚠️ CRITICAL STEP ⚠️
ON THIS SCREEN ONLY: You will see your AWS Access Key ID and AWS Secret Access Key

DOWNLOAD THE CSV FILE - This is your only chance to get these keys!

OPEN THE CSV FILE - You should see two critical values:

Access key ID: A 20-character code starting with AKIA

Secret access key: A 40-character code

Save the CSV file as aws-credentials.csv on your Desktop

DO NOT SHARE THIS FILE WITH ANYONE - These keys provide full access to your AWS account

Close the AWS window

Phase 3: Configure AWS CLI
Step 9: Install AWS CLI
Windows (Git Bash):
bash
# Download AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-windows-x86_64.zip" -o "awscliv2.zip"

# Extract it
unzip awscliv2.zip

# Install
./aws/install.exe
Mac (Terminal):
bash
# Download and install AWS CLI
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /
Step 10: Configure AWS Credentials with Your Access Key ID and Secret Access Key
Open Git Bash or Terminal

Run this command:

bash
aws configure
When prompted, enter these details FROM YOUR CSV FILE:

First Prompt:

text
AWS Access Key ID [None]: 
Open your aws-credentials.csv file

Copy the Access key ID value (20 characters, starts with AKIA)

Paste it here and press Enter

Second Prompt:

text
AWS Secret Access Key [None]: 
Copy the Secret access key value from your CSV file (40 characters)

Paste it here and press Enter

Third Prompt:

text
Default region name [None]: us-east-1
Type us-east-1 and press Enter

Fourth Prompt:

text
Default output format [None]: json
Type json and press Enter

Step 11: Verify AWS Configuration
Run this command to confirm your AWS Access Key ID and Secret Access Key are working:

bash
aws sts get-caller-identity
✅ SUCCESS LOOKS LIKE:

json
{
    "UserId": "AIDASAMPLEUSERID",
    "Account": "123456789012",
    "Arn": "arn:aws:iam::123456789012:user/terraform-user"
}
If you see this, your AWS credentials are correctly configured!

Phase 4: Download and Run the Terraform Project
Step 12: Download the Project Files
Download the project ZIP file or clone the repository containing the Terraform code

Extract the files to a folder on your Desktop called terraform-project

The folder should contain these files:

main.tf - Main Terraform configuration

providers.tf - Provider configurations

.gitignore - Git ignore rules

Step 13: Open the Project in VS Code
Open VS Code

Click "File" → "Open Folder"

Select the terraform-project folder on your Desktop

DO NOT MODIFY any of the Terraform files unless instructed

Step 14: Navigate to Project Directory
Open Git Bash or Terminal

Run these commands:

bash
# Navigate to the project folder
cd ~/Desktop/terraform-project

# Verify you're in the right location
ls -la
You should see the Terraform files listed.

Phase 5: Deploy with Terraform
Step 15: Initialize Terraform
Make sure you're in your project folder:

bash
cd ~/Desktop/terraform-project
Run initialization (this uses your AWS credentials automatically):

bash
terraform init
✅ SUCCESS LOOKS LIKE:

text
Terraform has been successfully initialized!
This command downloads all required providers and modules using your AWS Access Key ID and Secret Access Key.

Step 16: Plan the Deployment
bash
terraform plan
This shows what Terraform will create using your AWS credentials. Review the output to understand what resources will be deployed.

Step 17: Apply the Configuration
bash
terraform apply
Type yes when prompted to confirm

Wait for completion (this may take several minutes)

Terraform is now using your AWS Access Key ID and Secret Access Key to create real AWS resources

✅ SUCCESS LOOKS LIKE:

text
Apply complete! Resources: X added, 0 changed, 0 destroyed.
Phase 6: Cleanup (Avoid AWS Charges)
Step 18: Destroy Resources
bash
terraform destroy
Type yes when prompted. This uses your AWS credentials to delete all created resources so you don't get charged.

AWS Credential Security
🔐 Your AWS Access Key ID and Secret Access Key:
Never share these keys with anyone

Never commit them to version control (Git)

Never hardcode them in your Terraform files

Store the CSV file in a secure location

If compromised: Immediately delete the IAM user and create new keys

Proper Credential Flow:
text
AWS Console → IAM User → Access Key ID + Secret Access Key → aws configure → Terraform → AWS
File Guidelines
✅ FILES PROVIDED (DO NOT MODIFY):
main.tf - Main Terraform configuration

providers.tf - Provider configurations

.gitignore - Git ignore rules

❌ FILES YOU SHOULD NEVER MODIFY:
.terraform/ directory - Auto-generated, never modify

*.tfstate files - Auto-generated state files

*.tfstate.backup files - State backups

Troubleshooting Common Issues
"terraform: command not found"
Restart Git Bash/Terminal

Check Terraform installation path

"Unable to locate credentials" or "InvalidClientTokenId"
Run aws configure again

Verify your AWS Access Key ID and Secret Access Key from the CSV file

Make sure you're using the IAM user keys, not root user keys

"Error: No valid credential sources"
Check AWS Access Key ID and Secret Access Key are correct

Ensure IAM user has AdministratorAccess

Run aws sts get-caller-identity to test credentials

"Error: Failed to query available provider packages"
Check internet connection

Run terraform init again

Important Notes
Always run terraform destroy when you're done to avoid AWS charges

Never commit .tfstate files to version control (they may contain sensitive data)

Keep your AWS credentials secure - never share the Access Key ID and Secret Access Key

The provided Terraform code is tested and working - no modifications needed

Your AWS credentials are stored securely by AWS CLI and used automatically by Terraform

🎉 Congratulations!
You've successfully deployed infrastructure using Terraform! You now have:

Terraform installed and configured

AWS CLI set up with secure Access Key ID and Secret Access Key

Deployed real infrastructure using working Terraform code

Learned the complete Terraform workflow

Remember to always run terraform destroy when you're done testing!
