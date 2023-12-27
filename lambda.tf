resource "aws_lambda_function" "lambda" {
  filename         = "lambda_function.zip"
  function_name    = "Automation_Start_Stop_EC2"
  role             = aws_iam_role.Automation_Start_Stop.arn
  handler          = "*"
  source_code_hash = filebase64sha256("lambda_function.zip")
  runtime          = "python3.8"
}


## START

resource "aws_cloudwatch_event_rule" "automation_start_event_rule" {
  name                = "START_INSTANCE"
  description         = "Repete de Segunda a Sexta"
  schedule_expression = "cron(45 13 ? * MON-FRI *)"
}

resource "aws_cloudwatch_event_target" "start" {
  arn  = aws_lambda_function.lambda.arn
  rule = aws_cloudwatch_event_rule.automation_start_event_rule.id

  input = <<INPUT
  {
  "instances": "ID_DA_SUA_INSTANCIA",
  "action": "Start"
}
  INPUT
}

## STOP

resource "aws_cloudwatch_event_rule" "automation_stop_event_rule" {
  name                = "STOP_INSTANCE"
  description         = "Repete de Segunda a Sexta"
  schedule_expression = "cron(0 22 ? * MON-FRI *)"
}

resource "aws_cloudwatch_event_target" "stop" {
  arn  = aws_lambda_function.lambda.arn
  rule = aws_cloudwatch_event_rule.automation_stop_event_rule.id

  input = <<INPUT
  {
  "instances": "ID_DA_SUA_INSTANCIA",
  "action": "Stop"
}
  INPUT
}