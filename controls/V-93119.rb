# encoding: UTF-8

control "V-93119" do
  title "Windows Server 2019 must be configured to audit System - System
Integrity failures."
  desc  "Maintaining an audit trail of system activity logs can help identify
configuration errors, troubleshoot service disruptions, and analyze compromises
that have occurred, as well as detect attacks. Audit logs are necessary to
provide a trail of evidence in case the system or network is compromised.
Collecting this data is essential for analyzing the security of information
assets and detecting signs of suspicious and unexpected behavior.

    System Integrity records events related to violations of integrity to the
security subsystem."
  desc  "rationale", ""
  desc  'check', "Security Option \"Audit: Force audit policy subcategory settings (Windows
Vista or later) to override audit policy category settings\" must be set to
\"Enabled\" (WN19-SO-000050) for the detailed auditing subcategories to be
effective.

    Use the \"AuditPol\" tool to review the current Audit Policy configuration:

    Open \"PowerShell\" or a \"Command Prompt\" with elevated privileges (\"Run
as administrator\").

    Enter \"AuditPol /get /category:*\"

    Compare the \"AuditPol\" settings with the following:

    If the system does not audit the following, this is a finding.

    System >> System Integrity - Failure"
  desc  'fix', "Configure the policy value for Computer Configuration >>
Windows Settings >> Security Settings >> Advanced Audit Policy Configuration >>
System Audit Policies >> System >> \"Audit System Integrity\" with \"Failure\"
selected."
  impact 0.5
  tag 'severity': nil
  tag 'gtitle': 'SRG-OS-000327-GPOS-00127'
  tag 'satisfies': ["SRG-OS-000327-GPOS-00127", "SRG-OS-000471-GPOS-00215",
"SRG-OS-000471-GPOS-00216", "SRG-OS-000477-GPOS-00222"]
  tag 'gid': 'V-93119'
  tag 'rid': 'SV-103207r1_rule'
  tag 'stig_id': 'WN19-AU-000390'
  tag 'fix_id': 'F-99365r1_fix'
  tag 'cci': ["CCI-000172", "CCI-002234"]
  tag 'nist': ["AU-12 c", "AC-6 (9)", "Rev_4"]

  describe.one do
    describe audit_policy do
      its('System Integrity') { should eq 'Failure' }
    end
    describe audit_policy do
      its('System Integrity') { should eq 'Success and Failure' }
    end
  end

end

