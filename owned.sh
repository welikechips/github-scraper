
user=$1
token=$2
$urlOrgs=$3

mkdir -p ../users/$1/getem
mkdir -p ../users/$1/repos

cd ../users/$1/getem

httpsreplace="s/https:\/\//https:\/\/${user}:${token}@/g"

echo "${user}:${token}" > creds

curl -H "Authorization: token ${token}" $urlOrgs | grep repos_url | cut -d '"' -f4 > repourls.txt

echo "" > repos.txt && for url in $(cat repourls.txt); do echo $url; curl -H "Authorization: token ${token}" $url | grep clone_url | cut -d '"' -f4 | sed -e ${httpsreplace} >> repos.txt; done; 

for url in $(cat repos.txt); do git -C ../repos clone $url; done; 
