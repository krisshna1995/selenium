# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- Initial framework scaffold: Selenium 4 + Java 17 + Maven + TestNG + Cucumber
- Core layer: `ConfigReader`, `Environment`, listeners, utils, constants
- Data layer: models (`User`, `Product`, `Order`, `Address`), builders, data providers
- Page objects: `LoginPage`, `DashboardPage`, `CheckoutPage`, `RegistrationPage`, `CartPage`,
  `ProductDetailsPage`, `OrderConfirmationPage`, and page components
- Workflow helpers: `LoginWorkflow`, `CheckoutWorkflow`
- Test stubs: smoke, regression, e2e, API test classes
- Cucumber BDD: feature files, step definitions, `CucumberTestRunner`
- TestNG suites: master `testng.xml`, `smoke.xml`, `regression.xml`
- Reporting: Allure + ExtentReports integration stubs
- CI pipelines: nightly E2E matrix, smoke on PR/push, compile gate
- Docker: `Dockerfile` + `docker-compose.yml` for local Selenium Grid
- Docs: `architecture.md`, `getting-started.md`, `writing-tests.md`, `CONTRIBUTING.md`
- GitHub: `CODEOWNERS`, PR template, issue templates, Dependabot config
