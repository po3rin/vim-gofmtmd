test:
	circleci config process .circleci/config.yml > process.yml && circleci local execute -c process.yml --job build
