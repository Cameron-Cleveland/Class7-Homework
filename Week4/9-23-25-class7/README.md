# AWS EC2 Web Server Assignment   

## A — Create a Security Group (Console)  

1. Sign in to the **AWS Management Console**.  
2. Focus the browser’s “Services” search box (commonly top-left). Type **EC2** and press **Enter** to open the EC2 console.  
3. In the EC2 left navigation pane (look for **Network & Security**), locate and select **Security Groups**.  
4. Click the **Create security group** button.  
5. Fill the form:  
   - **Security group name:** whatever name you choose.  
   - **Description:** Web server security group - HTTP.  
   - **VPC:** choose the VPC you want (most users select the default VPC).  
6. Add inbound rules:  
   - Click **Add rule** (if needed). For an HTTP rule:  
   - **Type:** choose HTTP.  
   - **Source type:** choose Anywhere-IPv4.  
   - **Source:** choose My IP (recommended) or `0.0.0.0/0`.  
7. Leave outbound rules as the default (allow all).  
8. Click **Create security group**.  
9. Note the **Security group ID** (e.g., sg-0abcd1234ef5678).  

---

## A2 — Create a Key Pair (Console)  

1. In EC2 left nav, under **Network & Security**, select **Key pairs**.  
2. Click **Create key pair**.  
3. Enter **Key pair name**, e.g., `ec2-dev-key`.  
4. **Key pair type:** RSA.  
5. **Private key file format:** PEM (for OpenSSH/Git Bash).  
6. Click **Create key pair**.  

---

## A3 — Launch EC2 Instance (Console)  

1. In EC2 console left nav select **Instances → Instances**.  
2. Click **Launch instances** button.  
3. **Choose AMI** — leave the default (Amazon Linux AWS).  
4. **Choose instance type** — pick `t2.micro` (free tier if available). Click **Next**.  
5. **Key pair** — choose **Select a key pair** and pick `ec2-dev-key`.  
6. **Configure Security Group** — choose **Select an existing security group** and pick the one you created earlier.  
7. Expand **Advanced details → User data**: paste the startup script here.  
   - Label: “Advanced details” → “User data”.  
   - Paste the full script into the box.  
8. Click **Launch instance**.  

**Verify instance is running:**  
- Select the green **Success** link or open **Instances** from the left menu.  
- Copy the **Public DNS**
http://<paste Public DNS Address>

---

## A5 — Teardown (Console — step by step)  

1. In EC2 left nav choose **Instances → Instances**.  
2. Find the instance you created (look at the Name tag or Instance ID).  
3. Select the instance checkbox.  
4. Click the **Instance state** button (top toolbar).  
5. Choose **Terminate instance**.  
6. Confirm in the popup modal.  
7. Wait until the instance shows **shutting-down → terminated**.  

---
