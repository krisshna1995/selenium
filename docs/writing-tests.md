# Writing Tests

## Overview

All UI test classes **must** extend `BaseTest`. All page objects **must** extend `BasePage`.
Use workflows to encapsulate multi-step flows.

## Step 1 — Create or Extend a Page Object

```java
// src/main/java/com/company/automation/pages/ProductListPage.java
package com.company.automation.pages;

public class ProductListPage extends BasePage {
    // add locators (By fields) and action methods here
}
```

Use `data-testid` attributes as the preferred locator strategy.

## Step 2 — Optionally Create a Workflow

If the flow involves more than one page, add a workflow:

```java
// src/main/java/com/company/automation/workflows/AddToCartWorkflow.java
package com.company.automation.workflows;

public class AddToCartWorkflow {
    // compose page-object calls into one reusable action
}
```

## Step 3 — Write the Test Class

```java
// src/test/java/com/company/automation/tests/smoke/ProductListTest.java
package com.company.automation.tests.smoke;

import com.company.automation.base.BaseTest;
import org.testng.annotations.Test;

public class ProductListTest extends BaseTest {

    @Test
    public void productListDisplaysItems() {
        // use page objects / workflows; assert outcomes
    }
}
```

## Step 4 — Register in a Suite XML

Add the package or class to the appropriate suite file:

```xml
<!-- src/test/resources/suites/smoke.xml -->
<test name="Smoke Tests">
    <packages>
        <package name="com.company.automation.tests.smoke"/>
    </packages>
</test>
```

## Rules

| Rule | Reason |
|------|--------|
| **No `Thread.sleep()`** | Use `WaitUtils` explicit waits — flaky and slow |
| **No locators in test classes** | Locators belong in page objects |
| **No hardcoded env strings** | Use `ConfigReader` / `Environment` enum |
| **One assertion concept per test** | Makes failures easy to diagnose |
| **Extend `BaseTest`** | Ensures driver lifecycle and listeners are applied |
| **Extend `BasePage`** | Ensures consistent driver access and common helpers |

## Cucumber / BDD Tests

1. Add a `.feature` file under `src/test/resources/features/`.
2. Implement step definitions in `src/test/java/.../stepdefinitions/`.
3. The `CucumberTestRunner` picks them up automatically via classpath scanning.
