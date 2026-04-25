# Architecture

## Layered Design

```
┌─────────────────────────────────────────────┐
│                   Tests                     │
│  smoke / regression / e2e / api / cucumber  │
├─────────────────────────────────────────────┤
│                 Workflows                   │
│   LoginWorkflow, CheckoutWorkflow, …        │
├─────────────────────────────────────────────┤
│               Page Objects                  │
│  LoginPage, CartPage, …  + Components       │
├─────────────────────────────────────────────┤
│                Core Layer                   │
│  DriverManager │ ConfigReader │ WaitUtils   │
│  Listeners     │ Reporting    │ Constants   │
└─────────────────────────────────────────────┘
```

### Core Layer

- **`DriverManager`** — stores a `WebDriver` instance in a `ThreadLocal` for thread-safe parallel
  execution. Initialised in `BaseTest#setUp` and torn down in `BaseTest#tearDown`.
- **`DriverFactory`** — creates browser instances (Chrome/Firefox/Remote) based on config.
- **`ConfigReader`** — reads `/config/<env>.properties` where `<env>` is resolved from the
  `-Denv` system property (default: `qa`). Uses the `Environment` enum for type safety.
- **`WaitUtils` / `ElementUtils` / `JavaScriptUtils`** — hide raw Selenium API calls and
  provide fluent, log-annotated helpers.
- **`TestListener`** — implements `ITestListener`; logs pass/fail/skip; captures screenshots
  on failure via `ScreenshotUtil` and attaches them to Allure/Extent.
- **`RetryAnalyzer` + `RetryListener`** — `IRetryAnalyzer` for per-test retry logic;
  `IAnnotationTransformer` wires it onto every `@Test` automatically (no annotation needed).

### Page Object Layer

- Every page extends `BasePage`, which holds the driver reference and provides common
  interaction methods (`click`, `type`, `getText`, `scrollTo`).
- Page **components** (header, footer, modal, etc.) are separate classes injected into
  pages as needed — promotes reuse without deep inheritance.

### Workflow Layer

- Workflows compose multiple page-object interactions into a single reusable action,
  e.g. `LoginWorkflow#loginAs(user)`. Tests call workflows, not pages directly, keeping
  test code intention-revealing.

### Data Layer

- **Models** (`User`, `Product`, `Order`, `Address`) — plain POJOs, optionally annotated
  with Lombok `@Data` / `@Builder`.
- **Builders** — fluent builder classes with sensible defaults for quick fixture creation.
- **Data Providers** — TestNG `@DataProvider` methods that load fixtures from
  `src/test/resources/testdata/*.json` via `JsonUtils`.

### Reporting

- **Allure** — attached via `allure-testng` listener; enriched with `@Step`, `@Attachment`
  annotations. Results land in `target/allure-results`.
- **ExtentReports** — managed by `ExtentReportManager` (ThreadLocal `ExtentTest`); HTML
  report written to `test-output/extent/Spark.html`.
