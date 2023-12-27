resource "aws_iam_role" "Automation_Start_Stop" {
  name = "Automation_Start_Stop_EC2"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "lambda.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "start_stop-ec2" {
  role       = aws_iam_role.Automation_Start_Stop.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}
