package workflows

workflows: Workflow1: {
	on: [
		"push",
		"pull_request",
	]
	name: "Workflow 1"
	jobs: {
		workflow1_job1: {
			strategy: {
				"fail-fast": false
				matrix: {
					"go-version": [
						"1.19.x",
						"1.20.x",
					]
					platform: [
						"ubuntu-latest",
					]
				}
			}
			"runs-on": "${{ matrix.platform }}"
			defaults: run: {}
			steps: [_setupGo & {
				with: "go-version": "${{ matrix.go-version }}"
			}, {
				name: "Checkout code"
				uses: "actions/checkout@v3"
			}, {
				name: "Test"
				run:  "go test"
			}, {
				name: "Run"
				run:  "go run main.go \"from workflow 1 using ${{ matrix.go-version }}\""
			}]
		}
		workflow1_job2: {
			needs:     "workflow1_job1"
			"runs-on": "ubuntu-latest"
			defaults: run: {}
			steps: [{
				run: "echo Done"
			}]
		}
	}
}
