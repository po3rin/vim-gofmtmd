test_vim:
	circleci config process .circleci/config.yml > process.yml && \
		circleci local execute -c process.yml --job build && \

test_nvim:
	circleci config process .circleci/config.yml > process.yml && \
		circleci local execute -c process.yml --job build-neovim
