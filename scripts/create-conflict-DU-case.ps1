# Create a branches which will cause conflict in next merge
# Conflict is DU (Deleted by us)

$FILE = "CASE-DU.txt"

# Checkout main branch
git checkout main
git pull

# Create the file
echo "Hello world" > $FILE

# Add the file to the repo
git add $FILE
git commit -m "Add CASE-DU.txt"
git push upstream main
git push origin main

# Checkout develop branch
git checkout develop
git pull

# Merge change from main
git merge main

# Delete the file in downstream
git rm $FILE
git commit -m "Delete CASE-DU.txt in main"
git push origin develop

# Modify the file in downstream

# Modify the file in main
git checkout main
echo "Bye world" >> $FILE
git add $FILE
git commit -m "Modify CASE-DU.txt in main"
git push upstream main
