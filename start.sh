# usage: ./start.sh https://github.com/api/v3/user/orgs
# #example response: [
#   {
#     "login": "<APP>",
#     "id": <ID>,
#     "url": "https://github.com/api/v3/orgs/<APP>",
#     "repos_url": "https://github.com/api/v3/orgs/<APP>/repos",
#     "events_url": "https://github.com/api/v3/orgs/<APP>/events",
#     "hooks_url": "https://github.com/api/v3/orgs/<APP>/hooks",
#     "issues_url": "https://github.com/api/v3/orgs/<APP>/issues",
#     "members_url": "https://github.com/api/v3/orgs/<APP>/members{/member}",
#     "public_members_url": "https://github.com/api/v3/orgs/<APP>/public_members{/member}",
#     "avatar_url": "https://avatars.github.com/u/<ID>?",
#     "description": null
#   }
# ]

for cred in $(cat creds); do ./owned.sh $(echo ${cred} | cut -d: -f1) $(echo ${cred} | cut -d: -f2) $1; done;
