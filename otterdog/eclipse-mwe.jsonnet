local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('modeling.emf.mwe', 'eclipse-mwe') {
  settings+: {
    description: "",
    name: "Eclipse MWE project",
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
      default_workflow_permissions: "read",
    },
  },
  webhooks+: [
    orgs.newOrgWebhook('https://ci.eclipse.org/mwe/github-webhook/') {
      content_type: "json",
      events+: [
        "pull_request",
        "push"
      ],
    },
  ],
  _repositories+:: [
    orgs.newRepo('mwe') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Modeling Workflow Engine project repository (mwe)",
      homepage: "",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
  ],
}
