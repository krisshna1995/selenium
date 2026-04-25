# Selenium Automation Framework

Production-grade test automation framework built with **Selenium 4**, **Java 17**, **Maven**, **TestNG**, and **Cucumber**.

## Stack

| Layer | Technology |
|-------|-----------|
| Browser automation | Selenium 4.21.0 |
| Language | Java 17 |
| Build | Maven 3.9+ |
| Test runner | TestNG 7.10.2 |
| BDD | Cucumber 7.15.0 |
| Reporting | Allure 2.27 + ExtentReports 5 |
| API testing | REST Assured 5.4.0 |
| Logging | Log4j2 2.23.1 |
| Data | Jackson + JavaFaker + Apache POI |
| Driver management | WebDriverManager 5.8.0 |

## Project Layout

```
├── config/                  # Per-environment property files
├── docs/                    # Architecture and contributor docs
├── src/
│   ├── main/java/com/company/automation/
│   │   ├── core/            # Driver, config, listeners, utils, constants
│   │   ├── data/            # Models, builders, TestNG data providers
│   │   ├── pages/           # Page objects + components
│   │   └── workflows/       # Reusable multi-step user workflows
│   └── test/
│       ├── java/.../
│       │   ├── base/        # BaseTest (setup/teardown)
│       │   ├── tests/       # smoke/, regression/, e2e/, api/
│       │   ├── stepdefinitions/  # Cucumber glue code
│       │   └── runners/     # CucumberTestRunner
│       └── resources/
│           ├── features/    # .feature files
│           ├── suites/      # TestNG XML suite files
│           └── testdata/    # JSON fixtures
└── .github/workflows/       # CI pipelines
```

## Run Commands

```bash
# Install dependencies
mvn -B -DskipTests clean install

# Run all tests (QA env, Chrome)
mvn clean test -Denv=qa

# Run smoke suite only
mvn clean test -Psmoke -Denv=qa

# Run regression suite
mvn clean test -Pregression -Denv=qa

# Firefox headless
mvn clean test -Psmoke -Dbrowser=firefox -Dheadless=true

# Specific suite file
mvn clean test -DsuiteXmlFile=src/test/resources/suites/smoke.xml
```

## Reports

| Report | Location |
|--------|----------|
| Allure results | `target/allure-results/` |
| Allure HTML | Run `allure serve target/allure-results` |
| ExtentReports | `test-output/extent/Spark.html` |
| Surefire XML | `target/surefire-reports/` |

## Local Selenium Grid

```bash
# Start the grid (hub + Chrome + Firefox nodes)
docker compose up -d

# Run tests against the local grid
mvn clean test -Psmoke -Denv=qa -Dbrowser=chrome -DgridUrl=http://localhost:4444

# Tear down
docker compose down
```

## Environment Configuration

Copy `.env.example` to `.env` and adjust values. Pass environment via `-Denv=<dev|qa|staging|prod>`.
Per-env property files live in `config/<env>.properties`.

## More Docs

- [Architecture](docs/architecture.md)
- [Getting Started](docs/getting-started.md)
- [Writing Tests](docs/writing-tests.md)
- [Contributing](CONTRIBUTING.md)

