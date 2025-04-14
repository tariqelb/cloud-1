#!/bin/bash

#The perpose of this script is automatically create an Service Account and assign roles for terraform.
#The script also generate and download the key and then export it

#Make sure you have run gcloud auth login and selected the correct project 
echo "Make sure you have run gcloud auth login and selected the correct project\n\n"

#just adding some dummy seceruty
read -sp "Enter sudo password" Password
echo
echo "MY_PROJECT_ID=sapient-tangent-456419-j5"
echo
read -sp "Enter your project id" PROJECT_ID
echo

# Exit on error
set -e

# Your project ID
#PROJECT_ID="sapient-tangent-456419-j5"
# Service account name and ID
SERVICE_ACCOUNT_NAME="cloud-1-service-account"
SERVICE_ACCOUNT_ID="${SERVICE_ACCOUNT_NAME}@${PROJECT_ID}.iam.gserviceaccount.com"

# 1. Create the service account (skip if already created)
echo "Creating service account '${SERVICE_ACCOUNT_NAME}' in project '${PROJECT_ID}'..."
gcloud iam service-accounts create "${SERVICE_ACCOUNT_NAME}" \
  --description="Service account for Terraform automation" \
  --display-name="Cloud-1-service-account" \
  --project="${PROJECT_ID}" || echo "Service account may already exist, skipping."

# 2. Assign IAM roles
echo "Assigning roles to service account..."

ROLES=(
  "roles/compute.admin"
  "roles/compute.viewer"
  "roles/compute.networkAdmin"
  "roles/iam.serviceAccountUser"
)

for ROLE in "${ROLES[@]}"; do
  echo "Assigning ${ROLE}..."
  gcloud projects add-iam-policy-binding "${PROJECT_ID}" \
    --member="serviceAccount:${SERVICE_ACCOUNT_ID}" \
    --role="${ROLE}"
done

echo "✅ Service account setup complete!"

# 3. Generate and download service account key

KEY_FILE="./env/cloud-1-key.json"

if [[ ! -f "$KEY_FILE" ]]; then
  echo "Generating service account key..."
  gcloud iam service-accounts keys create "$KEY_FILE" \
    --iam-account="$SERVICE_ACCOUNT_ID" \
    --project="$PROJECT_ID"
else
  echo "Key already exists at $KEY_FILE, skipping key generation."
fi

# 4. Export credentials for Terraform
echo "Exporting GOOGLE_APPLICATION_CREDENTIALS..."
export GOOGLE_APPLICATION_CREDENTIALS="$KEY_FILE"


echo "✅ Key generated, downloaded and exported!."
