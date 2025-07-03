
```markdown
# 🚀 GCP Cloud Run CI/CD with Terraform and GitHub Actions

This project demonstrates a complete Infrastructure-as-Code (IaC) CI/CD pipeline on **Google Cloud Platform (GCP)** using:

- **Terraform** for provisioning infrastructure
- **GitHub Actions** for CI/CD automation
- **Cloud Run** for serverless container hosting
- **Artifact Registry** for Docker image storage
- **Google Cloud Storage (GCS)** for remote Terraform state
- A lightweight **FastAPI** Python app as the workload

---

## ✅ Features

- 🐳 Dockerized Python web app (FastAPI)
- 🔐 Secrets securely managed via GitHub Secrets
- 🛠️ Automated validation, planning, and deployment using GitHub Actions
- ☁️ Infrastructure managed by Terraform and stored in GCS
- 📦 Image built and stored in Artifact Registry
- 🚀 Deployed to GCP Cloud Run (fully managed)

---

## 🔧 Tech Stack

- Terraform
- GitHub Actions
- Google Cloud Platform (Cloud Run, IAM, GCS, Artifact Registry)
- Docker
- Python (FastAPI)

---

## 📁 Project Structure

.
├── terraform/
│   ├── main.tf
│   ├── provider.tf
│   ├── backend.tf
│   ├── variables.tf
│   └── outputs.tf
├── app/
│   ├── main.py
│   ├── Dockerfile
│   └── requirements.txt
└── .github/
└── workflows/
└── terraform.yml


---

## 🔐 Required GitHub Secrets

> Add these in **GitHub → Settings → Secrets → Actions**

| Secret Name        | Description                                                |
|--------------------|------------------------------------------------------------|
| `SERVICEACCOUNT`   | 🔒 Base64-encoded GCP service account key JSON             |
| `PROJECT_ID`       | Your GCP Project ID                                        |
| `REGION`           | GCP region                                                 |
| `DOCKER_IMAGE_URL` | Docker image path in Artifact Registry                     |

---

## 🛠️ Setup Instructions

### 1. Google Cloud Setup

- ✅ Enable required APIs: Cloud Run, Artifact Registry, Cloud Storage, IAM
- ✅ Create GCS bucket (with versioning) for Terraform backend
- ✅ Create Artifact Registry repo for Docker
- ✅ Create a service account with these roles:
  - `roles/artifactregistry.admin`
  - `roles/run.admin`
  - `roles/storage.admin`
  - `roles/iam.serviceAccountUser`
- ✅ Generate a **JSON key** for that service account

### 2. Prepare the GitHub Secrets

- Convert the service account key to base64:
  ```bash
  base64 -w 0 serviceaccount.json
````

* Add the following to your GitHub Secrets:

```
SERVICEACCOUNT     = [base64-encoded JSON content]
PROJECT_ID         = [your-project-id]
REGION             = [your-region]
DOCKER_IMAGE_URL   = [region]-docker.pkg.dev/[project-id]/[repo]/[image]:latest
```

### 3. Push the Code to GitHub

* Commit and push the code
* GitHub Actions will:

  * Validate Terraform
  * Run `terraform plan`
  * Wait for manual approval to apply (`workflow_dispatch`)
* Cloud Run will serve the app

---

## 🧪 Example FastAPI App

```python
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def root():
    return {"message": "Hello from Cloud Run 🚀"}
```

---

## 📝 Notes

* Terraform remote state is stored securely in GCS
* Docker image is hosted in Artifact Registry
* App is deployed serverlessly with Cloud Run
* Secrets are encrypted and managed by GitHub Actions

---

## 🔄 Future Improvements

* Add Slack or Discord deployment notifications
* Add staging and production environments with Terraform workspaces
* Configure custom domain and HTTPS via Cloud Run settings

---

## 📜 License

MIT — feel free to use, modify, and share.

---

## 🙋‍♂️ Author

> https://github.com/vikaskanchagarbelagal
> *“Built for learning, deployment, and GCP ACE portfolio boosting!”*

```


Happy building!
```
