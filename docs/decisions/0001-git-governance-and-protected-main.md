# ADR 0001: Git Governance and Protected Main Branch
Status: Accepted

## Context

PMIP is intended to represent a production-oriented data and AI platform.

Infrastructure, Databricks workloads, application code, orchestration,
observability, and CI/CD configuration will all be maintained in Git.

Uncontrolled changes directly to the main branch would increase the risk of:

- unreviewed infrastructure changes
- configuration drift
- accidental credential exposure
- untested application changes
- destructive Terraform changes
- difficult rollback and auditability

## Decision

The main branch will be treated as the protected integration branch.

Changes should originate from feature branches and be integrated through pull
requests.

For the initial single-developer phase:

- pull requests are required
- zero external approvals are required
- administrators are subject to branch protection
- force pushes to main are prohibited
- deletion of main is prohibited
- linear history is required
- unresolved pull request conversations block merge
- squash merge is the approved merge strategy

When additional engineers or reviewers participate:

- at least one approval will be required
- CODEOWNER approval will be enabled
- CI/CD status checks will become required
- additional security controls may be enabled

## Alternatives Considered

### Direct pushes to main

Rejected because it does not represent an appropriate production engineering
workflow.

### Require one approval immediately

Rejected during the single-developer phase because an author cannot provide the
independent approval required for their own pull request.

### GitHub Rulesets

Rulesets provide a more extensible governance model and may replace the initial
branch-protection configuration when PMIP moves to an organization or larger
engineering team.

## Consequences

Positive:

- auditable change history
- cleaner change review
- safer infrastructure changes
- consistent merge strategy
- future CI/CD enforcement point

Tradeoffs:

- additional pull request workflow
- more process for small changes
- protection rules must evolve as the team grows

## Security Implications

Protected main reduces the risk of unauthorized or accidental direct changes to
security-sensitive infrastructure and configuration.

## Operational Implications

Deployment automation will eventually execute only against controlled commits
merged into main.
