sudo yum install java-1.8.0-openjdk-devel -y
sudo yum install git -y
sudo yum install maven -y 
if [ -d "addressbook" ]
then
   echo "repo is cloined and exists"
   cd /home/ec2-user/addressbook
   git pull origin master
else
   echo "repo is not there"
git clone https://github.com/jeebujohn/addressbook.git
cd /home/ec2-user/addressbook
fi
mvn package