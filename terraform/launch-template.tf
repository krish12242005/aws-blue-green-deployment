resource "aws_launch_template" "blue_green" {
  name_prefix   = "blue-green-app-"
  image_id      = data.aws_ami.amazon_linux.id
  instance_type = "t3.micro"

  iam_instance_profile {
    name = aws_iam_instance_profile.ec2.name
  }

  vpc_security_group_ids = [
    aws_security_group.ec2.id
  ]

  user_data = base64encode(<<-EOF
    #!/bin/bash

    dnf update -y
    dnf install -y python3 python3-pip ruby wget

    # Install CodeDeploy Agent
    cd /tmp

    wget https://aws-codedeploy-ap-south-1.s3.ap-south-1.amazonaws.com/latest/install

    chmod +x install

    ./install auto

    systemctl enable codedeploy-agent
    systemctl start codedeploy-agent

    # Application directory
    mkdir -p /opt/blue-green-app

    # Python dependencies
    python3 -m pip install flask gunicorn

    # Initial application
    cat > /opt/blue-green-app/app.py <<'PYEOF'

    from flask import Flask

    app = Flask(__name__)

    @app.route("/")
    def home():
        return """
        <html>
            <head>
                <title>Blue-Green Deployment</title>
            </head>

            <body>
                <h1>Blue-Green Deployment</h1>
                <h2>Version 1.0 - BLUE</h2>
                <p>Application is running successfully.</p>
            </body>
        </html>
        """

    if __name__ == "__main__":
        app.run(host="0.0.0.0", port=5000)

    PYEOF

    # Start application
    nohup python3 /opt/blue-green-app/app.py \
      > /var/log/blue-green-app.log 2>&1 &

  EOF
  )

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name        = "blue-green-instance"
      Project     = "aws-blue-green-deployment"
      Environment = "production"
    }
  }
}