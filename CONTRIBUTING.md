# Contributing

Thank you for contributing! Please follow these guidelines.

## Branch Strategy

- Branch from `main`: `git checkout -b feat/my-feature main`
- Use descriptive branch names: `feat/`, `fix/`, `chore/`, `test/`
- Open a pull request against `main` when ready

## Where Things Go

| What | Where |
|------|-------|
| New page objects | `src/main/java/.../pages/` |
| New page components | `src/main/java/.../pages/components/` |
| Reusable workflows | `src/main/java/.../workflows/` |
| Core utilities | `src/main/java/.../core/utils/` |
| Test data models | `src/main/java/.../data/models/` |
| Test data builders | `src/main/java/.../data/builders/` |
| Smoke tests | `src/test/java/.../tests/smoke/` |
| Regression tests | `src/test/java/.../tests/regression/` |
| E2E tests | `src/test/java/.../tests/e2e/` |
| API tests | `src/test/java/.../tests/api/` |
| Feature files | `src/test/resources/features/` |
| Step definitions | `src/test/java/.../stepdefinitions/` |
| JSON fixtures | `src/test/resources/testdata/` |

## Before Pushing

1. Run the smoke suite: `mvn -Psmoke -Dheadless=true -Denv=qa clean test`
2. Ensure the compile gate passes: `mvn -DskipTests clean compile test-compile`
3. Check that no existing tests are broken

## Style Rules

- Java 17, 4-space indentation
- Prefer `data-testid` attributes for locators
- **No `Thread.sleep()`** — use `WaitUtils` explicit waits
- No hardcoded environment strings — use `ConfigReader` / `Environment` enum
- All page objects must extend `BasePage`
- All test classes must extend `BaseTest`
- One assertion concept per test method

## Code Review

All PRs require at least one review from `@krisshna1995`. The PR compile check CI
job must pass before merging.
