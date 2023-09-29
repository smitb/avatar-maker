# Create a repository "avatar-maker" in docker hub

# Build and push the container

docker build . -t fourcobas/avatar-maker:latest
docker login
docker push fourcobas/avatar-maker:latest

# Update the image url to your image in Docker Hub

# Prepare a python venv 
python3 -m venv venv

# Activate the venv
source venv/bin/activate

# Update the package manager
pip install pip -U

# Install ecs-compose-x
pip install ecs-composex

# Set AWS API keys
export AWS_ACCESS_KEY_ID="12345"
export AWS_SECRET_ACCESS_KEY="ABCDE"
export AWS_DEFAULT_REGION=eu-central-1

# Run below command only once for an AWS account
ecs-compose-x init

# Deploy the application
ecs-compose-x up -n avatar-maker-bas -f docker-compose.yaml