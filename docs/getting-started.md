# Getting Started

## Prerequisites

| Tool | Minimum version |
|------|----------------|
| JDK | 17 (Temurin recommended) |
| Maven | 3.9+ |
| Chrome | Latest stable |
| Firefox | Latest stable |
| Docker | 24+ (optional, for local Grid) |

## Clone and Build

```bash
git clone https://github.com/krisshna1995/selenium.git
cd selenium
mvn -B -DskipTests clean compile test-compile
```

## First Run

```bash
# Run the smoke suite against QA with Chrome (headless)
mvn clean test -Psmoke -Denv=qa -Dheadless=true
```

Reports are written to:
- `target/allure-results/` — run `allure serve target/allure-results` to view HTML
- `test-output/extent/Spark.html` — open in any browser

## Environment Configuration

Copy `.env.example` to `.env` and fill in any missing values. The `-Denv` system
property selects which `config/<env>.properties` file is loaded at runtime.

```bash
cp .env.example .env
# edit .env with your base URLs, credentials, etc.
mvn clean test -Denv=dev
```

## IDE Setup (IntelliJ IDEA)

1. Open the project root (`pom.xml`) as a Maven project.
2. Install the **Lombok** plugin: *Settings → Plugins → search "Lombok" → Install*.
3. Enable annotation processing: *Settings → Build → Compiler → Annotation Processors → Enable*.
4. Install the **Cucumber for Java** plugin for `.feature` file support.
5. Run any test class with right-click → *Run*.

## Running with Docker Grid

```bash
# Start hub + Chrome + Firefox nodes
docker compose up -d

# Run tests against the local grid
mvn clean test -Psmoke -Denv=qa -Dbrowser=chrome -DgridUrl=http://localhost:4444

# Stop the grid
docker compose down
```
