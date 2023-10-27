import requests
import os

orginization = input("What's your orginization? --> ")
token = input("What is your token collected from github? (under developer settings) --> ")

session = requests.Session()
session.headers.update({
    "Authorization": f"token {token}"
})

url = f"https://api.github.com/orgs/{orginization}/repos"
response = session.get(url)
repos = response.json()

for repo in repos:
    repo_url = repo["clone_url"]
    os.system(f"git clone {repo_url}")
