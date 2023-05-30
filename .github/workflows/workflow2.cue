package workflows

workflows: Workflow2: {
	on: [
		"push",
		"pull_request",
	]
	name: "Workflow 2"
	jobs: workflow2_job1: {
		"runs-on": "ubuntu-latest"
		defaults: run: shell: "bash"
		steps: [{
			name: "Install Go"
			uses: "actions/setup-go@v2"
			with: "go-version": "1.20.x"
		}, {
			name: "Checkout code"
			uses: "actions/checkout@v2"
		}, {
			name: "Test"
			run:  "go test"
		}, {
			name: "Run"
			run:  "go run main.go \"from workflow 2 using ${{ matrix.go-version }}\""
		}]
	}
}