# Create a branches which will cause conflict in next merge
# Conflict is UU (both modified)

$FILE = "CASE-UU.txt"

# Checkout main branch
git checkout main
git pull

# Create the file
echo "Hello world" > $FILE

# Add the file to the repo
git add $FILE
git commit -m "Add CASE-UU.txt"
git push upstream main
git push origin main

# Checkout develop branch
git checkout develop
git pull

# Merge change from main
git merge main

# Modify the file in downstream
echo "Bye world" >> $FILE
git add $FILE
git commit -m "Modify CASE-UU.txt in downstream"
git push origin develop

# Delete the file in main
git checkout main
echo "Bye bye world!" >> $FILE
git add $FILE
git commit -m "Modify CASE-UU.txt in main"
git push upstream main

