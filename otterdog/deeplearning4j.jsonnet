local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('technology.deeplearning4j', 'deeplearning4j') {
  settings+: {
    blog: "https://projects.eclipse.org/projects/technology.deeplearning4j",
    description: "The Eclipse Deeplearning4j Project",
    name: "Eclipse Deeplearning4j",
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  secrets+: [
    orgs.newOrgSecret('ORG_GPG_KEY_ID') {
      value: 'pass:bots/technology.deeplearning4j/gpg/key_id',
    },
    orgs.newOrgSecret('ORG_GPG_PASSPHRASE') {
      value: 'pass:bots/technology.deeplearning4j/gpg/passphrase',
    },
    orgs.newOrgSecret('ORG_GPG_PRIVATE_KEY') {
      value: 'pass:bots/technology.deeplearning4j/gpg/secret-subkeys.asc',
    },
    orgs.newOrgSecret('ORG_OSSRH_PASSWORD') {
      value: 'pass:bots/technology.deeplearning4j/central.sonatype.org/password',
    },
    orgs.newOrgSecret('ORG_OSSRH_USERNAME') {
      value: 'pass:bots/technology.deeplearning4j/central.sonatype.org/username',
    },
  ],
  _repositories+:: [
    orgs.newRepo('deeplearning4j') {
      allow_merge_commit: true,
      allow_rebase_merge: false,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "Suite of tools for deploying and training deep learning models using the JVM. Highlights include model import for keras, tensorflow, and onnx/pytorch, a modular and tiny c++ library for running math code and a java based math library on top of the core c++ library. Also includes samediff: a pytorch/tensorflow like library for running deep learn...",
      homepage: "http://deeplearning4j.konduit.ai",
      topics+: [
        "artificial-intelligence",
        "clojure",
        "deeplearning",
        "deeplearning4j",
        "dl4j",
        "gpu",
        "hadoop",
        "intellij",
        "java",
        "linear-algebra",
        "matrix-library",
        "neural-nets",
        "python",
        "scala",
        "spark"
      ],
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://hooks.gitcop.com/github') {
          content_type: "json",
          events+: [
            "pull_request",
            "pull_request_review_comment",
            "push"
          ],
          secret: "********",
        },
        orgs.newRepoWebhook('https://codeclimate.com/webhooks') {
          events+: [
            "pull_request",
            "push"
          ],
        },
        orgs.newRepoWebhook('https://fleep.io/hook/lkbcTigCQge7-79jO1mpwQ') {
          events+: [
            "push"
          ],
        },
        orgs.newRepoWebhook('https://api.codacy.com/events/github/2604ba8120274bc5b01202e8ae9cde25') {
          content_type: "json",
          events+: [
            "pull_request",
            "push"
          ],
        },
        orgs.newRepoWebhook('https://jenkins.konduit.ai/github-webhook/') {
          content_type: "json",
          events+: [
            "create",
            "delete",
            "pull_request",
            "push",
            "repository",
            "status"
          ],
          secret: "********",
        },
        orgs.newRepoWebhook('https://webhook.zenhub.com/webhook/github/v2') {
          content_type: "json",
          events+: [
            "issue_comment",
            "issues",
            "label",
            "member",
            "meta",
            "milestone",
            "pull_request",
            "pull_request_review",
            "pull_request_review_comment",
            "repository",
            "team_add"
          ],
          secret: "********",
        },
      ],
      secrets: [
        orgs.newRepoSecret('PACKAGES_GPG_KEY_NAME') {
          value: "********",
        },
        orgs.newRepoSecret('PACKAGES_GPG_PASS') {
          value: "********",
        },
        orgs.newRepoSecret('SONATYPE_GPG_KEY') {
          value: "********",
        },
        orgs.newRepoSecret('SONATYPE_USER1_PASS') {
          value: "********",
        },
        orgs.newRepoSecret('SONATYPE_USER_1') {
          value: "********",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          dismisses_stale_reviews: true,
          required_approving_review_count: 1,
          requires_strict_status_checks: true,
        },
      ],
      environments: [
        orgs.newEnvironment('github-pages'),
      ],
    },
    orgs.newRepo('deeplearning4j-docs') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Documentation for Deeplearning4j - Deep Learning for the JVM, Java & Scala",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "master",
      gh_pages_source_path: "/",
      homepage: "",
      topics+: [
        "deep-learning",
        "deep-neural-networks",
        "deeplearning4j",
        "documentation",
        "gh-pages",
        "machine-learning",
        "machine-learning-algorithms",
        "machine-learning-library",
        "machinelearning"
      ],
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://webhook.zenhub.io/webhook/github/v1/55c13da66fdb40cc09') {
          content_type: "json",
          events+: [
            "issue_comment",
            "issues",
            "label",
            "member",
            "milestone",
            "pull_request",
            "pull_request_review",
            "pull_request_review_comment",
            "repository",
            "team",
            "team_add"
          ],
          secret: "********",
        },
        orgs.newRepoWebhook('https://flock-apps.flock.co/github/webhook/7c2edb26020e4d4eadc9744bf1d33d2e') {
          content_type: "json",
          events+: [
            "create",
            "delete",
            "issue_comment",
            "issues",
            "pull_request",
            "pull_request_review_comment"
          ],
        },
      ],
      environments: [
        orgs.newEnvironment('github-pages'),
      ],
    },
    orgs.newRepo('deeplearning4j-examples') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Deeplearning4j Examples (DL4J, DL4J Spark, DataVec)",
      homepage: "http://deeplearning4j.konduit.ai",
      topics+: [
        "artificial-intelligence",
        "deeplearning",
        "deeplearning4j",
        "dl4j",
        "intellij",
        "javafx",
        "python",
        "zeppelin-notebook"
      ],
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('http://www.julython.org/api/v1/github') {
          events+: [
            "push"
          ],
          insecure_ssl: "1",
        },
        orgs.newRepoWebhook('https://flock-apps.flock.co/github/webhook/e370d62e257f449dad022b7c2ff62a7c') {
          content_type: "json",
          events+: [
            "create",
            "delete",
            "issue_comment",
            "issues",
            "pull_request",
            "pull_request_review_comment",
            "push"
          ],
        },
        orgs.newRepoWebhook('https://flock-apps.flock.co/github/webhook/833d15f7a1e54a7a8623630178a67845') {
          content_type: "json",
          events+: [
            "create",
            "delete",
            "issue_comment",
            "issues",
            "pull_request",
            "pull_request_review_comment",
            "push"
          ],
        },
        orgs.newRepoWebhook('https://webhook.zenhub.io/webhook/github/v1/50c23aa46ed747c6') {
          content_type: "json",
          events+: [
            "issue_comment",
            "issues",
            "label",
            "member",
            "milestone",
            "pull_request",
            "pull_request_review",
            "pull_request_review_comment",
            "repository",
            "team",
            "team_add"
          ],
          secret: "********",
        },
      ],
    },
  ],
} + {
  # snippet added due to 'https://github.com/EclipseFdn/otterdog-configs/blob/main/blueprints/add-dot-github-repo.yml'
  _repositories+:: [
    orgs.newRepo('.github')
  ],
}
