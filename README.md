# Automation on API token page

Test cases for the automation can be referred [here](https://docs.google.com/spreadsheets/d/1hoQxuAuyEZMM8PgHXhwmeI0hP3_iXd3Xbq-V_NQ7b3Q/edit?usp=sharing).

### Get started
1. Create a file containing your Deriv account's credentials (email and password), and initialize the variables 'my_email' and 'my_password':
````
-v my_email:<email>
-v my_password:<password>
````

2. Run the following command to execute the test.
````
robot -A <fileName containing credentials> test.robot
````
