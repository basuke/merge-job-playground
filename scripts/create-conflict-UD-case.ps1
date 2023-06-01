# Create a branches which will cause conflict in next merge
# Conflict is UD (upstream delete, downstream modify)

$FILE = "CASE-UD.txt"

# Checkout main branch
git checkout main
git pull

# Create the file
echo "Hello world" > $FILE

# Add the file to the repo
git add $FILE
git commit -m "Add CASE-UD.txt"
git push upstream main
git push origin main

# Checkout develop branch
git checkout develop
git pull

# Merge change from main
git merge main

# Modify the file in downstream
echo "Bye world" >> $FILE

# Commit the change
git add $FILE
git commit -m "Modify CASE-UD.txt in downstream"
git push origin develop

# Delete the file in main
git checkout main
git rm $FILE
git commit -m "Delete CASE-UD.txt in main"
git push upstream main
