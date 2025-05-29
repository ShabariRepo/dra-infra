#!/bin/bash
# user_data.sh

# Set variables
GH_OWNER="deepr-devsecops"
GH_REPO="ci-sandbox"
RUNNER_VERSION="2.317.0"  # Check for latest: https://github.com/actions/runner/releases
ARCH="x64"
PLATFORM="linux"
RUNNER_DIR="/actions-runner"

# Replace with a valid GitHub PAT with repo admin scope
GH_PAT="REPLACE_WITH_SECRET_PAT"

# Install dependencies
sudo yum update -y
sudo yum install -y curl jq tar

# Create runner directory
mkdir -p $RUNNER_DIR && cd $RUNNER_DIR

# Download and extract runner
curl -o actions-runner.tar.gz -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-${PLATFORM}-${ARCH}-${RUNNER_VERSION}.tar.gz
tar xzf actions-runner.tar.gz

# Get registration token
TOKEN=$(curl -s -X POST \
  -H "Authorization: token ${GH_PAT}" \
  -H "Accept: application/vnd.github+json" \
  https://api.github.com/repos/${GH_OWNER}/${GH_REPO}/actions/runners/registration-token | jq -r .token)

# Configure the runner
./config.sh --url https://github.com/${GH_OWNER}/${GH_REPO} \
            --token $TOKEN \
            --name $(hostname) \
            --labels self-hosted,Linux,X64 \
            --unattended

# Start the runner as a service
./svc.sh install
./svc.sh start
