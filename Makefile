SHELL=bash

set:
	@envsubst < ./SNSToSQS.template.yml > SNSToSQS.yml

create:
	@make set
	aws cloudformation create-stack --stack-name $(AWS_PREFIX)SNSToSQSStack --template-body file://./SNSToSQS.yml --parameters ParameterKey=$(AWS_PREFIX)UserPassword,ParameterValue=$(AWS_NEW_USER_PASSWORD) --capabilities CAPABILITY_IAM

delete:
	@make set
	aws cloudformation delete-stack --stack-name $(AWS_PREFIX)SNSToSQSStack
